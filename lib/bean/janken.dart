import 'package:flutter/foundation.dart';
import 'package:pegii_app/bean/jankenState.dart';

enum JankenFormat {
  Stone,
  Sheet,
  Scissors
}

enum JankenResult {
  win,
  aiko,
  lose,
}

const Map mapJankenStateImage = {
  JankenFormat.Scissors: "choki_500_interior_transparency.png",
  JankenFormat.Sheet: "paa_500_interior_transparency.png",
  JankenFormat.Stone: "guu_500_interior_transparency.png",
};

String bindImageFromJankenFormat(JankenFormat jankenFormat) {
  return mapJankenStateImage[jankenFormat];
}

String bindImageFromJankenState(JankenState jankenState) {
  return bindImageFromJankenFormat(jankenState.jankenFormat);
}

///Result for the first parameter
JankenResult getJankenResult(JankenFormat jankenFormat1, JankenFormat jankenFormat2) {
  return jankenFormat1 == jankenFormat2 ? JankenResult.aiko
      : (jankenFormat1 == JankenFormat.Scissors && jankenFormat2 == JankenFormat.Sheet)
          || (jankenFormat1 == JankenFormat.Sheet && jankenFormat2 == JankenFormat.Stone)
          || (jankenFormat1 == JankenFormat.Stone && jankenFormat2 == JankenFormat.Scissors)
        ? JankenResult.win
        : JankenResult.lose;
}