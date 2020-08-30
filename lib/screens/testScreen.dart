import 'package:flutter/material.dart';
import 'package:pegii_app/RandomUtils.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final List<JankenState> listJankenStateTop = [];
  final List<JankenState> listJankenStateBottom = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("!! Test Screen !!")),
      body: screenContent(),
    );
  }

  Widget screenContent() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Image(
              image: AssetImage("assets/janken/choki_500_interior_transparency.png"),
              fit: BoxFit.fitWidth,
            ),
          ),
          Flexible(
            child: Image(
            image: AssetImage("assets/janken/choki_500_interior_transparency.png"),
            fit: BoxFit.fitHeight,
            ),
          ),
        ],
      )
    );
  }

}
