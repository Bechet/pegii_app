import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';

class LevelCard extends StatelessWidget {

  final Level level;
  final Function onLevelCardTap;

  LevelCard({this.level, this.onLevelCardTap});

  @override
  Widget build(BuildContext context) {
      return InkWell(
        onTap: (() => onLevelCardTap(level)),
        child: Card(
            child: Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      backgroundImage: AssetImage('assets/characters/${level.characterImagePackageName}/01.png'),
                      radius: 20.0,
                    ),
                    Text(level.name),
                  ],
                ),
                Row(
                  children: level.listChallenge.map((challenge) {
                    return Icon(
                      challenge ? Icons.star : Icons.star_border,
                      color: Colors.orangeAccent,
                    );
                  }).toList(),
                ),
              ],
            )
        ),
      );
  }


}
