import 'package:pegii_app/bean/character.dart';

import '../randomUtils.dart';
import 'janken.dart';
import 'jankenState.dart';

class CharacterRandomPenguin extends Character{

  CharacterRandomPenguin() {
    this.name = "RandomPenguin";
    this.assetImageFolderName = "BluePenguin";
  }

  @override
  JankenFormat nextJankenFormat(List<JankenState> listJankenStateTop, List<JankenState> listJankenStateBottom) {
    return RandomUtils.randomJankenFormat();
  }
}