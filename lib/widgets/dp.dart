import 'dart:io';

import 'package:beta_home/models/data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class displayPicture extends StatelessWidget {
  XFile? file;
  displayPicture ({this.file});

  @override
  Widget build(BuildContext context) {
    return Stack(
    children: [
      Container(
        decoration: BoxDecoration(
            border: Border.all(width: 6, color: const Color(0xffFFDA58)),
            borderRadius: BorderRadius.circular(55)),
        width: 110,
        height: 110,
      ),
      Container(
        color: Colors.white,
        width: 50,
        height: 80,
      ),
      Positioned(
        top: 12,
        left: 12,
        right: 12,
        bottom: 12,
        child: Consumer<DataModel>(builder: (context, data, child) {
          return file == null
              ? CircleAvatar(
                  backgroundColor: Colors.transparent,
                  backgroundImage:
                      NetworkImage(data.profile?.profile_pic ?? 'http://'),
                )
              : ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                            File(file!.path),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.fitHeight,
                          ),
              );
        }),
      ),
    ],
  );
  }
}
// data.profile != null && data.profile!.profile_pic != null