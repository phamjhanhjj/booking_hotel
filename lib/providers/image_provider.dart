import 'package:flutter/material.dart';
import 'dart:io';

class ImageProviderModel with ChangeNotifier {
  File? _image;

  File? get image => _image;

  void setImage(File? image) {
    _image = image;
    notifyListeners();
  }
}