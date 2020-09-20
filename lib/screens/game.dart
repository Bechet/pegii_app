import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/utils/constant.dart';
import 'package:pegii_app/widgets/gameScoreWidget.dart';
import 'package:pegii_app/widgets/jankenGameHistoryWidget.dart';

import '../randomUtils.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Level level;
  JankenFormat currentEnemyJankenFormat;
  List<JankenFormat> listPlayerCard = [JankenFormat.Stone, JankenFormat.Scissors, JankenFormat.Sheet];
  List<JankenState> listJankenStateTop = [];
  List<JankenState> listJankenStateBottom = [];

  GlobalKey<JankenGameHistoryWidgetState> jankenGameHistoryWidgetState = GlobalKey();
  GlobalKey<GameScoreWidgetState> gameScoreWidgetState = GlobalKey();

  @override
  void initState() {
    super.initState();
    AssetsAudioPlayer.withId(Constant.idOstPlayer).playlistPlayAtIndex(1);
  }


  @override
  void dispose() {
    super.dispose();
    print("Game dispose");
    AssetsAudioPlayer.withId(Constant.idOstPlayer).playlistPlayAtIndex(0);
  }

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    level = data['level'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Level - ${level.nbLevel} ${level.name}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          GameScoreWidget(key: gameScoreWidgetState),
          // Enemy screen
          Expanded(
            child: Container(
              color: Colors.green,
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        // Card
                        Flexible(
                          child: Container(
                            child: Image(
                              image: AssetImage(
                                  'assets/janken/Nazo_card.png'),
//                                  height: 100,
//                                  width: 100,
                            ),
                          ),
                        ),
                        // Enemy image
                        Flexible(
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  width: 2,
                                )
                            ),
                            child: Image(
                              image: AssetImage(
                                  'assets/characters/${level.characterImagePackageName}/01.png'),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),



          // History
          JankenGameHistoryWidget(key: jankenGameHistoryWidgetState),

          //PlayerWidget
          playerWidget(),
        ],
      ),
    );
  }

  Widget playerWidget() {
    return Container(
        color: Colors.blue,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: listPlayerCard.map((jankenFormat) =>
              Flexible(
              child: Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  )
                ),
                child: InkWell(
                  onTap: () {
                    onPlayerCardTap(jankenFormat);
                  },
                  child: Image(
                    image: AssetImage("assets/janken/${bindImageFromJankenFormat(jankenFormat)}"),
                  ),
                ),
              ),
            ),
          ).toList(),
        ));
  }

  void onPlayerCardTap(JankenFormat playerJankenFormat) {
    setState(() {
      JankenFormat enemyJankenFormat = RandomUtils.randomJankenFormat();
      addJankenState(playerJankenFormat,enemyJankenFormat);
      jankenGameHistoryWidgetState.currentState.update(listJankenStateTop, listJankenStateBottom);
      // update game score
      gameScoreWidgetState.currentState.update(listJankenStateBottom[listJankenStateBottom.length-1].jankenResult);

      if(gameScoreWidgetState.currentState.getPlayerScore() >= 3) {
        _showMyDialog("you won !", "Ununununu");
      } else       if(gameScoreWidgetState.currentState.getEnemyScore() >= 3) {
        _showMyDialog("you lose !", "Zakome !!");
      }
    });
  }

  void addJankenState(JankenFormat playerJankenFormat, JankenFormat enemyJankenFormat) {
    // Brut test

    JankenResult jankenResultTop = getJankenResult(enemyJankenFormat, playerJankenFormat);
    JankenResult jankenResultBottom = getJankenResult(playerJankenFormat, enemyJankenFormat);

    JankenState jankenStateTop = new JankenState(jankenFormat: enemyJankenFormat, jankenResult: jankenResultTop);
    JankenState jankenStateBottom = new JankenState(jankenFormat: playerJankenFormat, jankenResult: jankenResultBottom);

    listJankenStateTop.add(jankenStateTop);
    listJankenStateBottom.add(jankenStateBottom);
  }


  Future<void> _showMyDialog(String title, String content) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(content),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
