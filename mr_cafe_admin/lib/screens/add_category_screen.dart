import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_cafe_admin/constant.dart';
import 'package:mr_cafe_admin/service/image_utility.dart';

import '../service/database_handler.dart';
import '../service/item_model.dart';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);
  static const String id = 'add_category';

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late var _image;
  late String itemName;
  late String image;
  late String price;
  late String description;
  bool isKweb = false;
  String? choosevalue;
  final DatabaseHandler? _databaseHandler = DatabaseHandler();

  getFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      _image = File(pickedFile!.path);
      image = Utility.base64String(_image.readAsBytesSync());

      if (_image == null) {
        isKweb = false;
      } else {
        isKweb = true;
      }
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * .9,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  color: kDarkColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: isKweb
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Utility.imageFromBase64String(image),
                      )
                    : Icon(
                        Icons.add_a_photo_outlined,
                        size: MediaQuery.of(context).size.width * 0.3,
                        color: Colors.white54,
                      ),
              ),
              TextButton(
                onPressed: () {
                  getFromGallery();
                },
                child: const Text(
                  "Upload Image",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                style: TextButton.styleFrom(shadowColor: kBackgroundColor),
              ),
              TextFormField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter item name"),
                onChanged: (value) {
                  setState(() {
                    itemName = value;
                  });
                },
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  // isDense: true,

                  hint: const Text("Select Category"),
                  dropdownColor: kBackgroundColor,
                  elevation: 1,
                  borderRadius: BorderRadius.circular(15),
                  iconEnabledColor: Colors.black,
                  items: const [
                    DropdownMenuItem(
                      child: Text("Hot Coffee"),
                      value: "Hot Coffe",
                    ),
                    DropdownMenuItem(
                      child: Text("Frapp"),
                      value: "Frapp",
                    ),
                    DropdownMenuItem(
                      child: Text("Cold Coffee"),
                      value: "Cold Coffe",
                    ),
                    DropdownMenuItem(
                      child: Text("Desert"),
                      value: "Desert",
                    ),
                  ],
                  onChanged: (String? value) {
                    setState(() {
                      choosevalue = value!;
                    });
                  },
                  value: choosevalue,
                ),
              ),
              TextFormField(
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Price"),
                onChanged: (value) {
                  setState(() {
                    price = value;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormField(
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter item description"),
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              ElevatedButton(
                onPressed: () async {
                  // print(itemnameCotroller.text.runtimeType);

                  ItemModel itemModel = ItemModel(image, itemName, choosevalue,
                      int.parse(price), description);

                  await _databaseHandler!.insert(itemModel);
                  print(image);
                  print(itemName);
                  print(choosevalue);
                  print(price);
                  print(description);
                  // var data = await _databaseHandler!.getItemList();
                  // print(data);
                  // var strinImage = base64Encode(imageBytes);
                  // print(strinImage);
                  // print(Image.memory(imageBytes).runtimeType);
                  // print((priceCotroller.text).runtimeType);
                  // print(descriptionCotroller.text.runtimeType);
                  // print(choosevalue.runtimeType);
                  // await insertDB();
                  // var data = await _databaseHandler!.getItemList();
                  // print(data);
                },
                child: Text(
                  "Save",
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * .05,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width * .5,
                      MediaQuery.of(context).size.height * .065),
                  primary: kButtonColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
