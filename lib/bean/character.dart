import '../randomUtils.dart';
import 'janken.dart';
import 'jankenState.dart';

abstract class Character {
  String name;
  String assetImageFolderName;

  Character({this.name, this.assetImageFolderName});

  JankenFormat nextJankenFormat(List<JankenState> listJankenStateTop, List<JankenState> listJankenStateBottom) {
    return JankenFormat.Stone;
  }
}