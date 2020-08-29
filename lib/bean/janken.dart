import 'package:flutter/foundation.dart';

enum JankenState {
  Stone,
  Sheet,
  Scissors
}

const Map mapJankenStateImage = {
  JankenState.Scissors: "choki_500.png",
  JankenState.Sheet: "paa_500.png",
  JankenState.Stone: "guu_500.png",
};

String bindImageFromJankenState(JankenState jankenState) {
  return mapJankenStateImage[jankenState];
}