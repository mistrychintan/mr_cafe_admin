import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';

class Utility {
  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      dataFromBase64String(base64String),
      fit: BoxFit.cover,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return Base64Decoder().convert(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }
}
