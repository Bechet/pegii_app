
import 'dart:math';

import 'package:pegii_app/bean/janken.dart';

class RandomUtils {
  static Random RANDOM = new Random();

  static JankenFormat randomJankenFormat() {
    return JankenFormat.values[RANDOM.nextInt(JankenFormat.values.length)];
  }
}