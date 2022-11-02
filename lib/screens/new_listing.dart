import 'dart:io';

import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/elements/text_field.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/helper/utils.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class NewListing extends StatefulWidget {
  final String typeId, typeTitle;

  const NewListing({Key? key, required this.typeId, required this.typeTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewListingState();
}

class _NewListingState extends State<NewListing> {
  List _cats = [];
  XFile? _photo;
  Object? _category;
  bool _isError = false;
  bool _isProgress = false;

  String _title = '', _price = '', _desc = '';

  // final TextEditingController _titleCont = TextEditingController();
  // final TextEditingController _priceCont = TextEditingController();
  final TextEditingController _catCont = TextEditingController();
  // final TextEditingController _descCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    getCats();
  }

  Future getCats() async {
    try {
      final resp = await ServerHelper.get('${UrlHelper.market}/categories');
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        if (json.status == 'success') {
          setState(() {
            _cats = json.data;
          });
        }
      }
    } catch (e) {}
  }

  Future _onSave() async {
    if (_photo == null ||
        _title.isEmpty ||
        _price.isEmpty ||
        _category == null) {
      setState(() {
        _isError = true;
      });
    } else {
      try {
        setState(() {
          _isProgress = true;
        });
        FormData data = FormData.fromMap({
          'title': _title,
          'desc': _desc,
          'price': _price,
        });
        data.files
            .add(MapEntry('photo', await MultipartFile.fromFile(_photo!.path)));
        final resp = await ServerHelper.post(UrlHelper.listings, data);
        print(resp['status']);
        if (resp['status'] == 200) {
          final HttpResp json = HttpResp.fromJson(resp['data']);
          Utils.showToast(json.msg);
          if (json.status == 'success') {
            // setState(() {
            //   _isEdit = false;
            // });
            if (!mounted) return;
            ServerHelper.getProfile(context);
          }
        } else {
          Utils.showToast('Connection error.');
        }
      } catch (e) {
        Utils.showToast('An error occurred.');
      }
      setState(() {
        _isProgress = false;
      });

      (() {
        Navigator.pop(context);
      })();
    }
  }

  _onAddPhoto() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _photo = file;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataModel>(builder: (context, data, child) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: const TextStyle(color: Colors.black),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_rounded,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text(
            'New Listing',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: _isProgress == false ? () => _onSave() : null,
              child: Text(_isProgress == false ? 'Save' : 'Saving...'),
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Text(
              //   typeId,
              //   style: const TextStyle(
              //     backgroundColor: Colors.grey,
              //   ),
              // ),
              DottedBorder(
                strokeWidth: 2,
                color: Colors.grey.shade300,
                dashPattern: const [4, 2],
                radius: const Radius.circular(10),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  child: Wrap(
                    children: [
                      if (_photo != null) ...[
                        Image.file(
                          File(_photo!.path),
                        ),
                      ],
                      GestureDetector(
                        onTap: _onAddPhoto,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: const Icon(Icons.add_to_photos_rounded),
                            ),
                            const Text(
                              'Add Photos',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 9,
                ),
                child: Text(
                  'Required',
                  style: TextStyle(
                    height: 0.1,
                    fontStyle: FontStyle.italic,
                    fontSize: _isError && _photo == null ? 10 : 0,
                    color: Colors.red.shade400,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.black45,
                textCapitalization: TextCapitalization.words,
                // controller: _titleCont,
                onChanged: (val) {
                  setState(() {
                    _title = val;
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Title',
                  // labelStyle: TextStyle(color: Colors.blue.shade300),
                  hintText: 'Title',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(8),
                  //   borderSide:
                  //       const BorderSide(width: 0, style: BorderStyle.none),
                  // ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  errorText: 'Required',
                  errorStyle: TextStyle(
                      height: 0.1,
                      fontStyle: FontStyle.italic,
                      fontSize: _isError && _title.isEmpty ? 10 : 0,
                      color: Colors.red.shade300),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black45,
                keyboardType: TextInputType.number,
                // controller: _priceCont,
                onChanged: (val) {
                  setState(() {
                    _price = val;
                  });
                },
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Price',
                  hintText: 'Price',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  errorText: 'Required',
                  errorStyle: TextStyle(
                    height: 0.1,
                    fontStyle: FontStyle.italic,
                    fontSize: _isError && _price.isEmpty ? 10 : 0,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                readOnly: true,
                cursorColor: Colors.black45,
                keyboardType: TextInputType.number,
                controller: _catCont,
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: BotomSheet.shape(),
                  context: context,
                  builder: (context) =>
                      BotomShet.productCategories(_cats, (val) {
                    Navigator.pop(context);
                    _catCont.text = val['name'];
                    setState(() {
                      _category = val;
                    });
                  }),
                ),
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Category',
                  hintText: 'Category',
                  border: InputBorder.none,
                  filled: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  fillColor: Colors.grey.shade100,
                  errorText: 'Required',
                  errorStyle: TextStyle(
                    height: 0.1,
                    fontStyle: FontStyle.italic,
                    fontSize: _isError && _category == null ? 10 : 0,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black45,
                keyboardType: TextInputType.multiline,
                // controller: _descCont,
                onChanged: (val) => _desc = val,
                // minLines: 3,
                // maxLines: 5,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  isDense: true,
                  labelText: 'Description (optional)',
                  hintText: 'Description (optional)',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
