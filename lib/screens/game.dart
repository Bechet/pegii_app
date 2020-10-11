import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/bean/character.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/utils/SaveManager.dart';
import 'package:pegii_app/utils/constant.dart';
import 'package:pegii_app/widgets/enemyAIWidget.dart';
import 'package:pegii_app/widgets/gameScoreWidget.dart';
import 'package:pegii_app/widgets/jankenGameHistoryWidget.dart';

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
  List<bool> listState = [];

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
        title: Text("Level - ${level.nbLevel} ${level.character.name}"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          GameScoreWidget(key: gameScoreWidgetState),
          // Enemy screen
          Expanded(
            child: Container(
              color: Colors.green,
              child: EnemyAiWidget(character: level.character),
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
      JankenFormat enemyJankenFormat = level.character.nextJankenFormat(listJankenStateTop, listJankenStateBottom);
      addJankenState(playerJankenFormat,enemyJankenFormat);
      jankenGameHistoryWidgetState.currentState.update(listJankenStateTop, listJankenStateBottom);
      // update game score
      gameScoreWidgetState.currentState.update(listJankenStateBottom[listJankenStateBottom.length-1].jankenResult);

      if(gameScoreWidgetState.currentState.getPlayerScore() >= 3) {
        level.nbWin++;
        saveAndShowPopup("You won !", "Ununununu...");
      } else if(gameScoreWidgetState.currentState.getEnemyScore() >= 3) {
        level.nbLose++;
        saveAndShowPopup("you lose !", "Zakome !!");
      }
      changeEnemyImage();
    });
  }

  void changeEnemyImage() async {
    listState.add(true);
    level.character.updateCurrentImage(level.character.calculateWinLoseStatus(listJankenStateTop[listJankenStateTop.length-1], gameScoreWidgetState.currentState.getPlayerScore() >= 3 || gameScoreWidgetState.currentState.getEnemyScore() >= 3));
    await Future.delayed(const Duration(seconds: 2));
    print(listState.length);
    if (listState.length >= 1) {
      if (listState.length == 1 && gameScoreWidgetState.currentState.getPlayerScore() <3 && gameScoreWidgetState.currentState.getEnemyScore() <3) {
        changeEnemyImageFromLoseStatus();
      }
      listState.removeLast();
    }
  }

  void changeEnemyImageFromLoseStatus() {
    setState(() {
      level.character.updateCurrentImage(level.character.calculateDefaultStatus(gameScoreWidgetState.currentState.getPlayerScore()));
    });
  }

  void saveAndShowPopup(String title, String message) async{
    await SaveManager.updateLevelAndSave(level);
    print("saveAndShowPopup, saved: ${level.nbWin}, ${level.nbLose}");
    _showMyDialog(title, message);
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
          backgroundColor: Colors.white70.withOpacity(0.5),
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
              child: Text(
                  'Ok',
              ),
              color: Colors.red.withOpacity(0.8),
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
            ),
          ],
        );
      },
    );
  }

}
