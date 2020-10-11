import 'package:pegii_app/bean/character.dart';

class Level {
  int nbLevel;
  int hardness;
  int nbWin;
  int nbLose;
  List<bool> listChallenge;
  Character character;

  Level({this.nbLevel, this.hardness, this.listChallenge, this.character, this.nbLose, this.nbWin});

  static int comparatorHardnessNbLevel(Level a, Level b) {
    int resultComparingHardness = a.hardness.compareTo(b.hardness);
    if (resultComparingHardness == 0) {
      return a.nbLevel.compareTo(b.nbLevel);
    }
    return resultComparingHardness;
  }
}