import 'package:flutter/material.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';

class JankenGameHistoryWidget extends StatefulWidget {
  JankenGameHistoryWidget({Key key}) : super(key: key);

  @override
  JankenGameHistoryWidgetState createState() => JankenGameHistoryWidgetState();
}

class JankenGameHistoryWidgetState extends State<JankenGameHistoryWidget> {
  List<JankenState> listJankenStateTop = [];
  List<JankenState> listJankenStateBottom = [];
  double iconHeight = 50.0;
  double iconWidth = 50.0;

  @override
  Widget build(BuildContext context) {
    return screenContent();
  }

  Widget screenContent() {
    return listJankenStateTop == null || listJankenStateTop.isEmpty ?
    SizedBox(height: iconHeight*2,) :
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              children: <Widget>[
                rowJankenIcons(listJankenStateTop),
                rowJankenIcons(listJankenStateBottom),
              ],
            )
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
            child: Container(
              child: Image(
                image: AssetImage("assets/janken/${bindImageFromJankenState(jankenState)}"),
                height: iconHeight,
                width: iconWidth,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  /// Update list data & view, called from parent
  void update(List<JankenState> listJankenStateTop, List<JankenState> listJankenStateBottom) {
    this.listJankenStateTop = listJankenStateTop;
    this.listJankenStateBottom = listJankenStateBottom;
  }
}
