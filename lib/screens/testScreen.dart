import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';

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
        children: listJankenState.map((jankenState) {
          return Container(
            color: jankenState.jankenResult == JankenResult.win ? Colors.green :
              jankenState.jankenResult == JankenResult.lose ? Colors.red :
                  Colors.yellow,
            child: Image(
              image: AssetImage("assets/janken/${bindImageFromJankenState(jankenState)}"),
              width: 40,
              height: 40,

            ),
          );
        }).toList(),
      ),
    );
  }


  void addJankenState() {
    // Brut test
    JankenFormat jankenFormatTop = JankenFormat.Stone;
    JankenFormat jankenFormatBottom = JankenFormat.Scissors;

    JankenResult jankenResultTop = getJankenResult(jankenFormatTop, jankenFormatBottom);
    JankenResult jankenResultBottom = getJankenResult(jankenFormatBottom, jankenFormatTop);

    JankenState jankenStateTop = new JankenState(jankenFormat: jankenFormatTop, jankenResult: jankenResultTop);
    JankenState jankenStateBottom = new JankenState(jankenFormat: jankenFormatBottom, jankenResult: jankenResultBottom);

    listJankenStateTop.add(jankenStateTop);
    listJankenStateBottom.add(jankenStateBottom);
  }
}
