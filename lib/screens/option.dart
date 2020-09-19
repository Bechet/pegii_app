import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:pegii_app/utils/constant.dart';

class Option extends StatefulWidget {
  @override
  _OptionState createState() => _OptionState();
}

class _OptionState extends State<Option> {
  bool isMusicOn = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Option"),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            "Music"
          ),
          Switch(
            value: isMusicOn,
            onChanged: ((value) {
              setState(() {
                isMusicOn = value;
                if (value) {
                  AssetsAudioPlayer.withId(Constant.idOstPlayer).play();
                } else {
                  AssetsAudioPlayer.withId(Constant.idOstPlayer).pause();
                }
              });
            }),
          ),
        ],
      ),
    );
  }


}
