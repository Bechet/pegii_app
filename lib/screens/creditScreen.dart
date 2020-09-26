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
                    "assets/characters/Peggy/Janken_peggy_2 lost_bis.png"
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
