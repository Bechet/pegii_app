import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/bean/CharacterRandomPenguin.dart';
import 'package:pegii_app/bean/level.dart';
import 'package:pegii_app/bean/saveData.dart';
import 'package:pegii_app/utils/SaveManager.dart';
import 'package:pegii_app/utils/constant.dart';
import 'package:pegii_app/widgets/levelCard.dart';

class ListLevel extends StatefulWidget {
  @override
  _ListLevelState createState() => _ListLevelState();
}

class _ListLevelState extends State<ListLevel> with RouteAware {

  final List<Level> listLevel = [
    Level(nbLevel: 1, hardness: 3, nbWin: 0, nbLose: 0, character: CharacterRandomPenguin()),
  ];

  void _onLevelCardTap(Level level) {
    Navigator.pushNamed(context, '/game', arguments: {
      'level': level,
    });
  }

  @override
  void initState() {
    super.initState();
    initSaveData();
    if (Constant.assetMainOstPath != AssetsAudioPlayer.withId(Constant.idOstPlayer).current.value.audio.assetAudioPath) {
      AssetsAudioPlayer.withId(Constant.idOstPlayer).playlistPlayAtIndex(0);
    }
  }

  Future initSaveData() async {
      List<SaveData> listLevelSaveData = await SaveManager.loadLevelSaveData();
      print("initSaveData listLevelSaveData, ${listLevelSaveData[0].nbLose} ${listLevelSaveData[0].nbWin} ");
      SaveManager.setListSaveData(listLevelSaveData);
      if (listLevelSaveData.isEmpty) {
        SaveManager.saveLevel(listLevel);
      } else {
        setState(() {
          for (int i=0; i<listLevel.length; i++) {
            listLevel[i].nbWin = listLevelSaveData[i].nbWin;
            listLevel[i].nbLose = listLevelSaveData[i].nbLose;
          }
        });
      }
  }

  @override
  Widget build(BuildContext context) {
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
