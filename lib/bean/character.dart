import '../randomUtils.dart';
import 'janken.dart';
import 'jankenState.dart';

abstract class Character {
  String name;
  String assetImageFolderName;
  WinLoseStatus winLoseStatus;
  String currentImageFileName;

  Character({this.name, this.assetImageFolderName}) {
    this.currentImageFileName = calculateImage(WinLoseStatus.initial);
  }

  JankenFormat nextJankenFormat(List<JankenState> listJankenStateTop, List<JankenState> listJankenStateBottom) {
    return JankenFormat.Stone;
  }

  WinLoseStatus calculateWinLoseStatus(JankenState jankenStateEnemy, bool isGameSet) {
    if (jankenStateEnemy == null || jankenStateEnemy.jankenFormat == null || jankenStateEnemy.jankenResult == null) {
      return WinLoseStatus.initial;
    } else if (isGameSet) {
      if (jankenStateEnemy.jankenResult == JankenResult.win) {
        return WinLoseStatus.winGameSet;
      } else {
        return WinLoseStatus.loseGameSet;
      }
    } else if (jankenStateEnemy.jankenResult == JankenResult.win) {
      if (jankenStateEnemy.jankenFormat == JankenFormat.Scissors) {
        return WinLoseStatus.winWithScissors;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Sheet) {
        return WinLoseStatus.winWithSheet;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Stone) {
        return WinLoseStatus.winWithStone;
      }
    } else if (jankenStateEnemy.jankenResult == JankenResult.aiko) {
      if (jankenStateEnemy.jankenFormat == JankenFormat.Scissors) {
        return WinLoseStatus.aikoWithScissors;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Sheet) {
        return WinLoseStatus.aikoWithSheet;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Stone) {
        return WinLoseStatus.aikoWithStone;
      }
    } else if (jankenStateEnemy.jankenResult == JankenResult.lose) {
      if (jankenStateEnemy.jankenFormat == JankenFormat.Scissors) {
        return WinLoseStatus.loseWithScissors;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Sheet) {
        return WinLoseStatus.loseWithSheet;
      } else if (jankenStateEnemy.jankenFormat == JankenFormat.Stone) {
        return WinLoseStatus.loseWithStone;
      }
    }
    print("OOPS, error calculateWinLoseStatus");
    return WinLoseStatus.initial;
  }

  void updateCurrentImage(WinLoseStatus winLoseStatus) {
    this.currentImageFileName = calculateImage(winLoseStatus);
  }

  String calculateImage(WinLoseStatus winLoseStatus);

}

enum WinLoseStatus {
  initial,
  loseGameSet,
  loseGameSet0,
  loseGameSet1,
  loseGameSet2,
  winGameSet,
  loseWithStone,
  loseWithSheet,
  loseWithScissors,
  winWithStone,
  winWithSheet,
  winWithScissors,
  aikoWithStone,
  aikoWithSheet,
  aikoWithScissors,
}
