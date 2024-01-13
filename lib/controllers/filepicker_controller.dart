import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';

class FilePickerController extends GetxController {
  Rx<File?> file = Rx<File?>(null);
  RxString name = ''.obs;

  Future<void> getFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp4'],
    );

    if (result != null) {
      File c = File(result.files.single.path!);
      file.value = c;
      name.value = result.names.toString();
    }
  }
}