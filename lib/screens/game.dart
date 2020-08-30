import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';
import 'package:pegii_app/bean/level.dart';
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

  void onPlayerCardTap(JankenFormat jankenFormat) {
    print(jankenFormat);
    setState(() {
      addJankenState(jankenFormat);
      jankenGameHistoryWidgetState.currentState.update(listJankenStateTop, listJankenStateBottom);
      // update game score
      gameScoreWidgetState.currentState.update(listJankenStateBottom[listJankenStateBottom.length-1].jankenResult);
    });
  }

  void addJankenState(JankenFormat playerJankenFormat) {
    // Brut test
    JankenFormat jankenFormatTop = RandomUtils.randomJankenFormat();
    JankenFormat jankenFormatBottom = playerJankenFormat;

    JankenResult jankenResultTop = getJankenResult(jankenFormatTop, jankenFormatBottom);
    JankenResult jankenResultBottom = getJankenResult(jankenFormatBottom, jankenFormatTop);

    JankenState jankenStateTop = new JankenState(jankenFormat: jankenFormatTop, jankenResult: jankenResultTop);
    JankenState jankenStateBottom = new JankenState(jankenFormat: jankenFormatBottom, jankenResult: jankenResultBottom);

    listJankenStateTop.add(jankenStateTop);
    listJankenStateBottom.add(jankenStateBottom);
  }
}
