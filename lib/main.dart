import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/screens/creditScreen.dart';
import 'package:pegii_app/screens/loading.dart';
import 'package:pegii_app/screens/home.dart';
import 'package:pegii_app/screens/game.dart';
import 'package:pegii_app/screens/listlevel.dart';
import 'package:pegii_app/screens/option.dart';
import 'package:pegii_app/screens/testScreen.dart';
import 'package:pegii_app/utils/constant.dart';

void main() {
  runApp(MainWidget());
}

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  AssetsAudioPlayer assetsAudioPlayer;


  @override
  void initState() {
    super.initState();
    if (assetsAudioPlayer == null) {
      assetsAudioPlayer = AssetsAudioPlayer.withId(Constant.idOstPlayer);
      playIfNotPlaying();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/loading': (context) => Loading(),
        '/game': (context) => Game(),
        '/listLevel': (context) => ListLevel(),
        '/test': (context) => TestScreen(),
        '/credit': (context) => CreaditScreen(),
        '/option': (context) => Option(),
      },
    );
  }

  void playIfNotPlaying() {
    if (assetsAudioPlayer.isPlaying.value == false) {
      assetsAudioPlayer.open(
        Audio("assets/music/ost/Top_Speed.mp3"),
        autoStart: true,
        showNotification: true,
        playInBackground: PlayInBackground.disabledRestoreOnForeground,
        loopMode: LoopMode.single,
      );
    }
  }


}

