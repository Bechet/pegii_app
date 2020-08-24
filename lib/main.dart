import 'package:flutter/material.dart';
import 'package:pegii_app/screens/loading.dart';
import 'package:pegii_app/screens/home.dart';
import 'package:pegii_app/screens/game.dart';
import 'package:pegii_app/screens/listlevel.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
      '/game': (context) => Game(),
      '/listLevel': (context) => ListLevel(),
    },
  ));
}
