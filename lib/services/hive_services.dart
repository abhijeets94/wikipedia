import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveService {
  isExists({String? boxName}) async {
    final openBox = await Hive.openBox(boxName!);
    int length = openBox.length;
    return length;
  }

  addBoxes<T>({List<T>? items, String? boxName}) async {
    debugPrint("adding boxes");
    final openBox = await Hive.openBox(boxName!);
    for (var i in items!) {
      openBox.add(i);
    }
  }

  getBoxes<T>({String? boxName}) async {
    debugPrint("getting box $boxName");
    List<T> boxList = [];
    final openBox = await Hive.openBox(boxName!);
    int length = openBox.length;
    for (int i = 0; i < length; i++) {
      boxList.add(openBox.getAt(i));
    }
    return boxList;
  }
}
