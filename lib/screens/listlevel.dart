import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';

class ListLevel extends StatefulWidget {
  @override
  _ListLevelState createState() => _ListLevelState();
}

class _ListLevelState extends State<ListLevel> {

  final List<Level> listLevel = [
    Level(name: "red", listChallenge: [false, false]),
    Level(name: "green", listChallenge: [false, false]),
    Level(name: "black", listChallenge: [true, false]),
    Level(name: "white", listChallenge: [false, false]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose a level"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: listLevel.map((level) => levelCard(level)).toList(),
      )
    );


  }

  Widget levelCard(Level level) {
    return Card(
      margin: EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          Column(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.lightBlueAccent,
                backgroundImage: AssetImage('assets/characters/slime_${level.name}.png'),
                radius: 20.0,
              ),
              Text(level.name),
            ],
          ),
          Row(
            children: level.listChallenge.map((challenge) {
              return Icon(
                challenge ? Icons.star : Icons.star_border,
                color: Colors.orangeAccent,
              );
            }).toList(),
          ),
        ],
      )
    );
  }
}
