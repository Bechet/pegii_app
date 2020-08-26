import 'package:flutter/material.dart';

class Level {
  int nbLevel;
  String name;
  List<bool> listChallenge;
  String characterImagePackageName;

  Level({this.nbLevel, this.name, this.listChallenge, this.characterImagePackageName});
}