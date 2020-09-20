import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/utils/constant.dart';
import 'package:pegii_app/widgets/levelCard.dart';

class ListLevel extends StatefulWidget {
  @override
  _ListLevelState createState() => _ListLevelState();
}

class _ListLevelState extends State<ListLevel> with RouteAware {

  final List<Level> listLevel = [
    Level(nbLevel: 1, name: "The penguin", listChallenge: [false, false], characterImagePackageName: "BluePenguin"),
  ];

  Function _onLevelCardTap(Level level) {
    Navigator.pushNamed(context, '/game', arguments: {
      'level': level,
    });
  }

  @override
  void initState() {
    super.initState();
    print("initState level");
    if (Constant.assetMainOstPath != AssetsAudioPlayer.withId(Constant.idOstPlayer).current.value.audio.assetAudioPath) {
      AssetsAudioPlayer.withId(Constant.idOstPlayer).playlistPlayAtIndex(0);
    }
  }

  @override
  Widget build(BuildContext context) {
    print("building level");
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
