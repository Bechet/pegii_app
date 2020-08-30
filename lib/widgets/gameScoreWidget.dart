import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';


class GameScoreWidget extends StatefulWidget {
  GameScoreWidget({Key key}) : super(key: key);

  @override
  GameScoreWidgetState createState() => GameScoreWidgetState();
}

class GameScoreWidgetState extends State<GameScoreWidget> {
  int playerScore = 0;
  int enemyScore = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text("You: $playerScore"),
          Text("Enemy: $enemyScore"),
        ],
      ),
    );
  }

  void playerWin() {
    playerScore+=1;
  }

  void enemyWin() {
    enemyScore +=1;
  }

  /// Given the playerJankenResult, update the score
  void update(JankenResult playerJankenResult) {
    if (playerJankenResult == JankenResult.win) {
      playerWin();
    } else if (playerJankenResult == JankenResult.lose) {
      enemyWin();
    }
  }

  int getPlayerScore() {
    return playerScore;
  }

  int getEnemyScore() {
    return enemyScore;
  }
}
