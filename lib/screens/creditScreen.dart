import 'package:flutter/material.dart';

class CreaditScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Credit"),
          centerTitle: true,
          backgroundColor: Colors.yellow,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image(
                image: AssetImage(
                    "assets/characters/BluePenguin/02.png"
                ),
              ),
              Text(
                  "日本語大丈夫かテスト(*'▽')"
              ),
              Text(
                  "クレジットなんてまだねーよ"
              ),
            ],
          ),
        )
    );

    return Container(


    );
  }
}
