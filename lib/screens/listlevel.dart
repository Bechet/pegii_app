import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/bean/CharacterPenguinGuChokiPaa.dart';
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
    Level(nbLevel: 2, hardness: 1, nbWin: 0, nbLose: 0, character: CharacterPenguinGuuChokiPaa()),
  ];

  void _onLevelCardTap(Level level) {
    Navigator.pushNamed(context, '/game', arguments: {
      'level': level,
    });
  }

  @override
  void initState() {
    super.initState();
    reorderListLevel();
    initSaveData();
    if (Constant.assetMainOstPath != AssetsAudioPlayer.withId(Constant.idOstPlayer).current.value.audio.assetAudioPath) {
      AssetsAudioPlayer.withId(Constant.idOstPlayer).playlistPlayAtIndex(0);
    }
  }

  Future initSaveData() async {
      List<SaveData> listLevelSaveData = await SaveManager.loadLevelSaveData();
      if (listLevelSaveData.isEmpty) {
        // no save data, init
        await SaveManager.saveLevel(listLevel);
        listLevelSaveData = await SaveManager.loadLevelSaveData();
      }
      SaveManager.setListSaveData(listLevelSaveData);
      setState(() {
        for (int i = 0; i < listLevelSaveData.length; i++) {
          for (int j = 0; j < listLevel.length; j++) {
            if (listLevelSaveData[i].nbLevel == listLevel[j].nbLevel) {
              listLevel[j].nbWin = listLevelSaveData[i].nbWin;
              listLevel[j].nbLose = listLevelSaveData[i].nbLose;
            }
          }
        }
      });
      if (listLevel.length != listLevelSaveData.length) {
        SaveManager.saveLevel(listLevel);
        List<SaveData> listLevelSaveData = await SaveManager.loadLevelSaveData();
        SaveManager.setListSaveData(listLevelSaveData);
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

  void reorderListLevel() {
    listLevel.sort((a, b) => Level.comparatorHardnessNbLevel(a, b));
  }

}
