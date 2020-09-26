import 'package:flutter/material.dart';
import 'package:pegii_app/bean/character.dart';

class EnemyAiWidget extends StatefulWidget {
  Character character;

  EnemyAiWidget({this.character});

  @override
  _EnemyAiWidgetState createState() => _EnemyAiWidgetState(character: character);
}

class _EnemyAiWidgetState extends State<EnemyAiWidget> {
  Character character;

  _EnemyAiWidgetState({this.character});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.0),
        // decoration: BoxDecoration(
        //     border: Border.all(
        //       width: 2,
        //     )
        // ),
        child: Image(
          image: AssetImage(
              'assets/characters/${character.assetImageFolderName}/${character.currentImageFileName}'),
        ),
      ),
    );
  }
}
