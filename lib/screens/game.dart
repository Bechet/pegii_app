import 'package:flutter/material.dart';
import 'package:pegii_app/bean/level.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  Level level;

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
          enemyWidget(level),
          // Player screen
          playerWidget(),
        ],
      ),
    );
  }

  Widget enemyWidget(Level level) {
    return Expanded(
      child: Container(
          color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Container(
                    color: Colors.green,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        // Card
                        Container(
                          margin: EdgeInsets.fromLTRB(30.0, 20.0, 20.0, 20.0),
                          child: Image(
                            image: AssetImage('assets/janken/choki_500_interior_transparency.png'),
                          ),
                        ),
                        // Enemy image
                        Flexible(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(30.0, 40.0, 20.0, 20.0),
                            child: Image(
                              image: AssetImage('assets/characters/${level.characterImagePackageName}/01.png'),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
              Expanded(
                child: Container(
                  color: Colors.grey,
                  child: Text("element 2"),
                ),
              ),
            ],
          )),
    );
  }

  Widget playerWidget() {
    return Expanded(
      child: Container(
          color: Colors.blue,
          child: Row(
            children: <Widget>[
              Text("1"),
              Text("2"),
              Text("3"),
              Text("4"),
            ],
          )),
    );
  }
}
