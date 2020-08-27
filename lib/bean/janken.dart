import 'package:flutter/foundation.dart';

enum JankenState {
  Stone,
  Sheet,
  Scissors
}

const Map mapJankenStateImage = {
  JankenState.Scissors: "choki.png",
  JankenState.Sheet: "paa.png",
  JankenState.Stone: "guu.png",
};

String bindImageFromJankenState(JankenState jankenState) {
  return mapJankenStateImage[jankenState];
}