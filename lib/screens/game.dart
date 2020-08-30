import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';
import 'package:pegii_app/bean/level.dart';
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

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context).settings.arguments;
    level = data['level'];
    return Scaffold(
      appBar: AppBar(
        title: Text("Level - ${level.nbLevel} ${level.name}"),
      ),
      body: Column(
        children: <Widget>[
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

          // JankenHistory
          Column(
          mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: <Widget>[
                      rowJankenIcons(listJankenStateTop),
                      rowJankenIcons(listJankenStateBottom),
                    ],
                  )),
            ],
          ),

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

  Widget rowJankenIcons(List<JankenState> listJankenState) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listJankenState.map((jankenState) {
          return Container(
            color: jankenState.jankenResult == JankenResult.win ? Colors.green :
            jankenState.jankenResult == JankenResult.lose ? Colors.red :
            Colors.yellow,
            child: Container(
              child: Image(
                image: AssetImage("assets/janken/${bindImageFromJankenState(jankenState)}"),
                height: 50.0,
                width: 50.0,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  void onPlayerCardTap(JankenFormat jankenFormat) {
    print(jankenFormat);
    setState(() {
      addJankenState(jankenFormat);
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
