import 'package:flutter/material.dart';
import 'package:pegii_app/bean/CharacterRandomPenguin.dart';
import 'package:pegii_app/bean/character.dart';
import 'package:pegii_app/widgets/enemyAIWidget.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  Character character = CharacterRandomPenguin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("!! Test Screen !!")),
      body: screenContent(),
    );
  }

  Widget screenContent() {
    return Container
      (
        child: EnemyAiWidget(character: character),
      );
  }




}


