import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/widgets/levelCard.dart';

class ListLevel extends StatefulWidget {
  @override
  _ListLevelState createState() => _ListLevelState();
}

class _ListLevelState extends State<ListLevel> {

  final List<Level> listLevel = [
    Level(nbLevel: 1, name: "The penguin", listChallenge: [false, false], characterImagePackageName: "BluePenguin"),
  ];

  Function _onLevelCardTap(Level level) {
    Navigator.pushNamed(context, '/game', arguments: {
      'level': level,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a level"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: listLevel.map((level) => LevelCard(level: level, onLevelCardTap: _onLevelCardTap)).toList(),
      )
    );
  }

}
