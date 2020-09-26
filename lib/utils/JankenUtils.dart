import 'package:pegii_app/bean/janken.dart';

class JankenUtils {

  /// returns Janken result for the first jankenFormat
  static JankenResult calculateJankenResult(JankenFormat jankenFormat1, JankenFormat jankenFormat2) {
    if (
      (jankenFormat1 == JankenFormat.Stone && jankenFormat2 == JankenFormat.Sheet)
      || (jankenFormat1 == JankenFormat.Scissors && jankenFormat2 == JankenFormat.Stone)
      || (jankenFormat1 == JankenFormat.Sheet && jankenFormat2 == JankenFormat.Scissors)
    ) {
      return JankenResult.lose;
    } else if (
      (jankenFormat1 == JankenFormat.Stone && jankenFormat2 == JankenFormat.Stone)
        || (jankenFormat1 == JankenFormat.Scissors && jankenFormat2 == JankenFormat.Scissors)
        || (jankenFormat1 == JankenFormat.Sheet && jankenFormat2 == JankenFormat.Sheet)
    ) {
      return JankenResult.aiko;
    } else if (
      (jankenFormat1 == JankenFormat.Sheet && jankenFormat2 == JankenFormat.Stone)
        || (jankenFormat1 == JankenFormat.Stone && jankenFormat2 == JankenFormat.Scissors)
        || (jankenFormat1 == JankenFormat.Scissors && jankenFormat2 == JankenFormat.Sheet)
    ) {
      return JankenResult.win;
    } else {
      print("ERROR: WTF");
      return JankenResult.aiko;
    }
  }
}