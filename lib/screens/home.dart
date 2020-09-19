
import 'package:flutter/material.dart';
import 'package:pegii_app/randomUtils.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peggy Janken"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image(
              image: AssetImage(
                "assets/characters/BluePenguin/01.png"
              )
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: MaterialButton(
                child: Text("Play !"),
                onPressed: (() {
                  print("playing...");
                  Navigator.pushNamed(context, '/listLevel');
                }),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: MaterialButton(
                  child: Text("Credit"),
                  onPressed: (() {
                    print("credit...");
                    Navigator.pushNamed(context, '/credit');
                  }),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 3,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: MaterialButton(
                child: Text("Option"),
                onPressed: (() {
                  print("option...");
                  Navigator.pushNamed(context, '/option');
                }),
              ),
            ),
          ],
        ),
      )
    );
  }
}
