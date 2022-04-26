import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_cafe_admin/constant.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);
  static const String id = 'add_category';

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  var _image;
  bool isKweb = false;
  getFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      _image = File(pickedFile!.path);
      isKweb = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Add New Category'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .05,
            vertical: MediaQuery.of(context).size.width * .05),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                getFromGallery();
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kDarkColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: isKweb
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.image,
                        size: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.white54,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
