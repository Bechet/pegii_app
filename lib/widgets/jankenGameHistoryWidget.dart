import 'package:flutter/material.dart';
import 'package:pegii_app/RandomUtils.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';

class JankenGameHistoryWidget extends StatefulWidget {
  JankenGameHistoryWidget({Key key}) : super(key: key);

  @override
  _JankenGameHistoryWidgetState createState() => _JankenGameHistoryWidgetState();
}

class _JankenGameHistoryWidgetState extends State<JankenGameHistoryWidget> {
  List<JankenState> listJankenStateTop = [];
  List<JankenState> listJankenStateBottom = [];

  @override
  Widget build(BuildContext context) {
    return screenContent();
  }


  Widget screenContent() {
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
    JankenFormat jankenFormatTop = RandomUtils.randomJankenFormat();
    JankenFormat jankenFormatBottom = RandomUtils.randomJankenFormat();

    JankenResult jankenResultTop = getJankenResult(jankenFormatTop, jankenFormatBottom);
    JankenResult jankenResultBottom = getJankenResult(jankenFormatBottom, jankenFormatTop);

    JankenState jankenStateTop = new JankenState(jankenFormat: jankenFormatTop, jankenResult: jankenResultTop);
    JankenState jankenStateBottom = new JankenState(jankenFormat: jankenFormatBottom, jankenResult: jankenResultBottom);

    listJankenStateTop.add(jankenStateTop);
    listJankenStateBottom.add(jankenStateBottom);
  }
}
