import 'dart:io';

import 'package:beta_home/helper/server_helper.dart';
import 'package:beta_home/helper/url_helper.dart';
import 'package:beta_home/models/data.dart';
import 'package:beta_home/models/http_resp.dart';
import 'package:beta_home/widgets/dp.dart';
import 'package:beta_home/widgets/screen_bar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool _isEdit = false;
  XFile? display;
  final TextEditingController _nameCont = TextEditingController();
  final TextEditingController _emailCont = TextEditingController();
  final TextEditingController _countryCont = TextEditingController();
  final TextEditingController _phoneCont = TextEditingController();
  final TextEditingController _addrCont = TextEditingController();

  void _onImageSelected(File file) async {
    final DataModel dataModel = Provider.of<DataModel>(context, listen: false);
    await dataModel.uploadProfilePicture(file);
  }


  Future<void> _onPickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    // if (file != null) {
    //   final File? imagefile = File(file!.path);
     _onImageSelected(File(file!.path));
     setState(() {
       display = file;
     });
    }
      // if (file == null) return;
  
  // setState(() {
  //  display = File(file.path);
  // });
 // }

  @override
  void initState() {
    super.initState();
    ProfileModel? profile = Provider.of<DataModel>(context, listen: false).profile;
    _nameCont.text = '${profile?.first_name} ${profile?.last_name}';
    _emailCont.text = '${profile?.email}';
    _phoneCont.text = profile?.phone ?? '';
    _countryCont.text = profile?.country_code ?? '';
    _addrCont.text = profile?.address ?? '';
  }

  Future _onSubmit() async {
    final name = _nameCont.text.split(' ');
    try {
//       FormData formData = FormData.from({
//    "name": "wendux",
//    "file1": UploadFileInfo(File("./upload.jpg"), "upload1.jpg")
// });
var form = FormData.fromMap({
    'first_name': name[0],
        'last_name': name[1],
        'country_code': _countryCont.text,
        'phone': _phoneCont.text,
        'address': _addrCont.text,
    'file': await MultipartFile.fromFile(
      display!.path,
      filename: display!.name,
    ),
  });

      final resp = await ServerHelper.put(UrlHelper.profile,form);
      if (resp['status'] == 200) {
        final HttpResp json = HttpResp.fromJson(resp['data']);
        Fluttertoast.showToast(msg: json.msg, toastLength: Toast.LENGTH_LONG);
        if (json.status == 'success') {
          setState(() {
            _isEdit = false;
          });
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
    final Function(File) onSelect = Provider.of<DataModel>(context).uploadProfilePicture;
    return Consumer<DataModel>(builder: (context, data, child) {
      print(data);
      return Scaffold(
        appBar: ScreenBar.build(context, 'Profile'),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  displayPicture(file: display,),
                  // dp(),
                  const SizedBox(
                    width: 30,
                  ),
                  GestureDetector(
                    onTap: _onPickImage,
                    child: Column(
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Container(
                          width: 24,
                          height: 3,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () => setState(() {
                      _isEdit = true;
                    }),
                    style: TextButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      backgroundColor: const Color(0xffFFDA58),
                    ),
                    child: const Text(
                      'Edit Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                textCapitalization: TextCapitalization.words,
                controller: _nameCont,
                decoration: const InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffECECEC),
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
                cursorColor: Colors.black,
                readOnly: true,
                controller: _emailCont,
                decoration: const InputDecoration(
                  hintText: 'Email',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffECECEC),
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
                cursorColor: Colors.black,
                readOnly: !_isEdit,
                keyboardType: TextInputType.phone,
                controller: _phoneCont,
                decoration: const InputDecoration(
                  hintText: 'Phone No.',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffECECEC),
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
                cursorColor: Colors.black,
                maxLines: null,
                minLines: 2,
                readOnly: !_isEdit,
                textCapitalization: TextCapitalization.words,
                controller: _addrCont,
                decoration: const InputDecoration(
                  hintText: 'Address',
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Color(0xffECECEC),
                ),
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xff000000),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Visibility(
                visible: _isEdit,
                child: TextButton(
                  onPressed: _onSubmit,
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xffFFDA58),
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
