import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_cafe_admin/constant.dart';

class AddCategory extends StatelessWidget {
  const AddCategory({Key? key}) : super(key: key);
  static const String id = 'add_category';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Add New Category'),
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
                  child: Icon(
                    Icons.image,
                    size: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.white54,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

getFromGallery() async {
  PickedFile pickedFile = await ImagePicker().getImage(
    source: ImageSource.gallery,
    maxWidth: 1800,
    maxHeight: 1800,
  );
}
