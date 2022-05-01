import 'dart:convert';

import 'dart:io';

import 'package:mr_cafe_admin/service/database_handler.dart';
import 'package:mr_cafe_admin/service/item_model.dart';
import 'package:mr_cafe_admin/service/item_repo.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mr_cafe_admin/constant.dart';

String TABLENAME = 'ITEM';

class AddCategory extends StatefulWidget {
  const AddCategory({Key? key}) : super(key: key);
  static const String id = 'add_category';

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  late var _image;
  bool isKweb = false;
  String? choosevalue;
  Database? _database;
  TextEditingController itemnameCotroller = TextEditingController();
  TextEditingController priceCotroller = TextEditingController();
  TextEditingController descriptionCotroller = TextEditingController();
  getFromGallery() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    setState(() {
      _image = File(pickedFile!.path);
      print(_image);
      if (_image == null) {
        isKweb = false;
      } else {
        isKweb = true;
      }
    });
  }

  Future<Database?> openDB() async {
    _database = await DatabaseHandler().openDB();
    return _database;
  }

  Future<ItemModel> insertDB() async {
    _database = await openDB();
    ItemRepo itemRepo = ItemRepo();
    itemRepo.CreateTable(_database);

    ItemModel itemModel = ItemModel(
        _image.readAsBytesSync(),
        itemnameCotroller.text,
        choosevalue!,
        int.parse(priceCotroller.text),
        descriptionCotroller.text);
    await _database?.insert(TABLENAME, itemModel.toMap());
    // await _database?.close();
    return itemModel;
  }

  getDataFromItem() async {
    _database = await openDB();
    ItemRepo itemRepo = ItemRepo();
    await itemRepo.getItem(_database);
    await _database?.close();
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
                        child: Image.file(
                          _image,
                          fit: BoxFit.cover,
                        ),
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
                child: Text(
                  "Upload Image",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                  ),
                ),
                style: TextButton.styleFrom(shadowColor: kBackgroundColor),
              ),
              TextFormField(
                controller: itemnameCotroller,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter item name"),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: DropdownButton(
                  isExpanded: true,
                  // isDense: true,
                  hint: Text("Select Category"),
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
                controller: priceCotroller,
                decoration:
                    kTextFieldDecoration.copyWith(hintText: "Enter Price"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              TextFormField(
                controller: descriptionCotroller,
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Enter item description"),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .03,
              ),
              ElevatedButton(
                onPressed: () async {
                  // print(itemnameCotroller.text.runtimeType);
                  // print(_image);
                  // var imageBytes = _image.readAsBytesSync();
                  // print(imageBytes.runtimeType);
                  // var strinImage = base64Encode(imageBytes);
                  // print(strinImage);
                  // print(Image.memory(imageBytes).runtimeType);
                  // print((priceCotroller.text).runtimeType);
                  // print(descriptionCotroller.text.runtimeType);
                  // print(choosevalue.runtimeType);
                  await insertDB();
                  var data = await getDataFromItem();
                  print(data);
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
