import 'package:pegii_app/bean/character.dart';

class Level {
  int nbLevel;
  int hardness;
  int nbWin;
  int nbLose;
  List<bool> listChallenge;
  Character character;

  Level({this.nbLevel, this.hardness, this.listChallenge, this.character, this.nbLose, this.nbWin});
}