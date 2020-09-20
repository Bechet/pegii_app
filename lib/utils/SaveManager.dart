import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/bean/saveData.dart';

class SaveManager {
  static List<SaveData> listSaveData;

  static Future<List<SaveData>> loadLevelSaveData() async {
    try {
      final file = await _localLevelFile;
      // Read the file
      String contents = await file.readAsString();
      List<dynamic> listMap = jsonDecode(contents);

      // map into beans
      return mapListDynamicIntoBeans(listMap);
    } catch(e) {
      print(e);
      return [];
    }
  }

  static Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    // For your reference print the AppDoc directory
    print(directory.path);
    return directory.path;
  }

  static Future<File> get _localLevelFile async {
    final path = await _localPath;
    return File('$path/dataLevelFile.json');
  }

  static Future saveLevel(List<Level> levels) async{
    final List<SaveData> listSaveData = [];
    for (var level in levels) {
      listSaveData.add(SaveData(nbLose: level.nbLose, nbWin: level.nbWin, nbLevel: level.nbLevel));
    }
    save(listSaveData);
  }

  static Future save(List<SaveData> listSaveData) async{
    final String levelJson= jsonEncode(listSaveData);
    final file = await _localLevelFile;
    file.writeAsString(levelJson);
  }

  static Future updateLevelAndSave(Level levelToUpdate) async {
    final SaveData saveData = SaveData(nbLose: levelToUpdate.nbLose, nbLevel: levelToUpdate.nbLevel, nbWin:  levelToUpdate.nbWin);
    listSaveData[levelToUpdate.nbLevel-1] = saveData;
    return save(listSaveData);
  }

  static void setListSaveData(List<SaveData> _listSaveData) {
    listSaveData = _listSaveData;
  }

  static List<SaveData> mapListDynamicIntoBeans(List listMap) {
    final List<SaveData> listSaveData = [];
    for (dynamic dynamicSaveData in listMap) {
      listSaveData.add(SaveData(
        nbWin: dynamicSaveData['nbWin'],
        nbLevel: dynamicSaveData['nbLevel'],
        nbLose: dynamicSaveData['nbLose'],
      ));
    }
    return listSaveData;
  }



}