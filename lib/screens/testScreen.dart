import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

  final List<String> listJankenState = [];
  String aText = "est";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("!! Test Screen !!")
      ),
      body : screenContent(),
    );
  }

  Widget screenContent() {
    print(listJankenState);
    return Column(
      children: <Widget>[
        Text("$aText"),
        Image(
          image: AssetImage("assets/janken/choki.png"),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: listJankenState.map((text) {
                return Icon(Icons.add);
              }).toList(),
          ),
        ),
        IconButton(
          icon: Icon(
              Icons.add
          ),
          onPressed: (() {
            setState(() {
              addJankenState();
            });
          }),
        ),
      ],
    );
  }

  void addJankenState() {
    listJankenState.add("JankenState.Scissors");
    print(listJankenState);
    mapJankenStateImage.containsKey(JankenState.Stone);
  }
}



