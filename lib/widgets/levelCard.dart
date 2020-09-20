import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/utils/constant.dart';
import 'package:pegii_app/widgets/starRow.dart';

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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      backgroundImage: AssetImage('assets/characters/${level.character.assetImageFolderName}/01.png'),
                      radius: 20.0,
                    ),
                    Text(level.character.name),
                  ],
                ),
                Column(
                  children: <Widget>[
                    StarRow(min: level.hardness, max: Constant.maxHardness),
                    Row(
                      children: <Widget>[
                        Text(
                          "Win: ${level.nbWin} "
                        ),

                        Text(
                            "Lose: ${level.nbLose} "
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
        ),
      );
  }


}
