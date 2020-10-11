import 'package:pegii_app/bean/character.dart';

import '../randomUtils.dart';
import 'CharacterPenguin.dart';
import 'janken.dart';
import 'jankenState.dart';

class CharacterPenguinGuuChokiPaa extends CharacterPenguin {

  CharacterPenguinGuuChokiPaa() {
    this.name = "JankenPeggy";
  }

  /// Only does random then in order stone => scissors => paper => stone ...
  @override
  JankenFormat nextJankenFormat(List<JankenState> listJankenStateEnemy, List<JankenState> listJankenStatePlayer) {
    JankenFormat next;
    if (listJankenStateEnemy.isEmpty) {
      next = RandomUtils.randomJankenFormat();
    } else {
      switch (listJankenStateEnemy[listJankenStateEnemy.length-1].jankenFormat) {
        case JankenFormat.Sheet:
          next = JankenFormat.Stone;
          break;
        case JankenFormat.Scissors:
          next = JankenFormat.Sheet;
          break;
        case JankenFormat.Stone:
          next = JankenFormat.Scissors;
          break;
      }
    }
    return next;
  }
}
