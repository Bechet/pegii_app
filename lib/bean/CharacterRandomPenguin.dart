import 'package:pegii_app/bean/character.dart';

import '../randomUtils.dart';
import 'CharacterPenguin.dart';
import 'janken.dart';
import 'jankenState.dart';

class CharacterRandomPenguin extends CharacterPenguin {

  CharacterRandomPenguin() {
    this.name = "RandomPeggy";
    this.assetImageFolderName = "Peggy";
  }

  @override
  JankenFormat nextJankenFormat(List<JankenState> listJankenStateTop, List<JankenState> listJankenStateBottom) {
    return RandomUtils.randomJankenFormat();
  }
}
