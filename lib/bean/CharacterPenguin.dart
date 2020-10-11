import 'package:pegii_app/bean/character.dart';

import '../randomUtils.dart';
import 'janken.dart';
import 'jankenState.dart';

class CharacterPenguin extends Character{

  CharacterPenguin() {
    this.name = "Peggy";
    this.assetImageFolderName = "Peggy";
  }

  @override
  String calculateImage(WinLoseStatus winLoseStatus) {
    String updatedImage = "Janken_peggy_0 lost_bis.png"; // default
    if (winLoseStatus == WinLoseStatus.initial) {
      updatedImage = "Janken_peggy_0 lost_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseGameSet) {
      updatedImage = "Janken_peggy_3 lost_bis.png";
    } else if (winLoseStatus == WinLoseStatus.winGameSet) {
      updatedImage = "Janken_peggy_win_bis.png";
    } else if (winLoseStatus == WinLoseStatus.aikoWithScissors) {
      updatedImage = "Janken_peggy_choki_draw_bis.png";
    } else if (winLoseStatus == WinLoseStatus.aikoWithSheet) {
      updatedImage = "Janken_peggy_paa_draw_bis.png";
    } else if (winLoseStatus == WinLoseStatus.aikoWithStone) {
      updatedImage = "Janken_peggy_guu_draw_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseGameSet0) {
      updatedImage = "Janken_peggy_0 lost_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseGameSet1) {
      updatedImage = "Janken_peggy_1 lost_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseGameSet2) {
      updatedImage = "Janken_peggy_2 lost_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseWithScissors) {
      updatedImage = "Janken_peggy_choki_sad_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseWithSheet) {
      updatedImage = "Janken_peggy_paa_sad_bis.png";
    } else if (winLoseStatus == WinLoseStatus.loseWithStone) {
      updatedImage = "Janken_peggy_guu_sad_bis.png";
    } else if (winLoseStatus == WinLoseStatus.winWithScissors) {
      updatedImage = "Janken_peggy_choki_happy_bis.png";
    } else if (winLoseStatus == WinLoseStatus.winWithSheet) {
      updatedImage = "Janken_peggy_paa_happy_bis.png";
    } else if (winLoseStatus == WinLoseStatus.winWithStone) {
      updatedImage = "Janken_peggy_guu_happy_bis.png";
    }
    return updatedImage;
  }
}