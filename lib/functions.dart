import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

Future writeToStorage(key, value) async {
  final st = GetStorage();
  await st.write(key, value);
  return log("written succesfully");
}

Future readFromStorage(key) async {
  try {
    final st = GetStorage();
    var data = await st.read(key);
    return data;
  } catch (e) {
    print(e);
  }
}
