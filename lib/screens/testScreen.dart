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
  List<WinLoseStatus> listWinLoseStatus = [WinLoseStatus.aikoWithScissors, WinLoseStatus.aikoWithSheet, WinLoseStatus.aikoWithStone];
  int index = 0;
  List<bool> listState = [];

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
        child: Column(
          children: <Widget>[
            EnemyAiWidget(character: character),
            MaterialButton(
              child: Text("change image"),
              onPressed: (changeImage),
            ),
          ],
        ),
      );
  }

  void changeImage() async {
    listState.add(true);
    setState(() {
      character.updateCurrentImage(listWinLoseStatus[index]);
      index = (index + 1) % (listWinLoseStatus.length);
    });
    await Future.delayed(const Duration(seconds: 2));
    print(listState.length);
    if (listState.length >= 1) {
      if (listState.length == 1) {
        setState(() {
          print("inside setState()");
          character.updateCurrentImage(WinLoseStatus.initial);
        });
      }
      listState.removeLast();
    }
    print("change Image");
  }




}


