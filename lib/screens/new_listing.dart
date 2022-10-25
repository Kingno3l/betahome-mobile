import 'package:beta_home/elements/bottom_sheet.dart';
import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/widgets/botom_sheet.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/DP.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class NewListing extends StatefulWidget {
  final String typeId, typeTitle;

  const NewListing({Key? key, required this.typeId, required this.typeTitle})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _NewListingState();
}

class _NewListingState extends State<NewListing> {
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _countryCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _addrCont = TextEditingController();

  List<DropdownMenuItem<String>> categories = [];

  Future _onSubmit() async {
    final name = _nameCont.text.split(' ');
    try {
      final resp = await ServerHelper.put(UrlHelper.profile, {
        'first_name': name[0],
        'last_name': name[1],
        'country_code': _countryCont.text,
        'phone': _phoneCont.text,
        'address': _addrCont.text,
      });
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        if (json.status == 'success') {
          // setState(() {
          //   _isEdit = false;
          // });
          if (!mounted) return;
          ServerHelper.getProfile(context);
        }
      } else {
        Fluttertoast.showToast(
            msg: 'Connection error.', toastLength: Toast.LENGTH_LONG);
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString(), toastLength: Toast.LENGTH_LONG);
    }
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
              onPressed: _onSubmit,
              child: const Text('Save'),
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
                      Column(
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
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                cursorColor: Colors.black45,
                textCapitalization: TextCapitalization.words,
                controller: _nameCont,
                decoration: InputDecoration(
                  labelText: 'Title',
                  hintText: 'Title',
                  // border: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(8),
                  //   borderSide:
                  //       const BorderSide(width: 0, style: BorderStyle.none),
                  // ),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
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
                controller: _nameCont,
                decoration: InputDecoration(
                  labelText: 'Price',
                  hintText: 'Price',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.grey.shade100,
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
                // controller: _nameCont,
                onTap: () => showModalBottomSheet(
                  isScrollControlled: true,
                  shape: BotomSheet.shape(),
                  context: context,
                  builder: (context) => BotomShet.productCategories(
                      [1, 2, 3, 4], (val) => print(val)),
                ),
                decoration: InputDecoration(
                  labelText: 'Category',
                  hintText: 'Category',
                  border: InputBorder.none,
                  filled: true,
                  suffixIcon: const Icon(Icons.arrow_drop_down),
                  fillColor: Colors.grey.shade100,
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
                controller: _nameCont,
                minLines: 3,
                maxLines: 5,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
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
