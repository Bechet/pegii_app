import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<JankenState> listJankenStateTop = [];
  final List<JankenState> listJankenStateBottom = [];

  String aText = "est";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("!! Test Screen !!")),
      body: screenContent(),
    );
  }

  Widget screenContent() {
    print(listJankenStateTop);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("$aText"),
        Image(
          image: AssetImage("assets/janken/choki_500.png"),
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[
                rowJankenIcons(listJankenStateTop),
                rowJankenIcons(listJankenStateBottom),
              ],
            )),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: (() {
            setState(() {
              addJankenState();
            });
          }),
        ),
      ],
    );
  }

  Widget rowJankenIcons(List<JankenState> listJankenState) {
    return Container(
      height: 40,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: listJankenStateTop.map((jankenState) {
          return Image(
            image: AssetImage("assets/janken/${mapJankenStateImage[jankenState]}"),
            width: 40,
            height: 40,
          );
        }).toList(),
      ),
    );
  }

  void addJankenState() {
    listJankenStateTop.add(JankenState.Scissors);
    listJankenStateBottom.add(JankenState.Scissors);
  }
}
