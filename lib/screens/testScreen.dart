import 'package:flutter/material.dart';
import 'package:pegii_app/utils/SaveManager.dart';
import 'package:pegii_app/widgets/testWidget.dart';

class TestScreen extends StatefulWidget {
  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  GlobalKey<TestWidgetState> testWidget = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("!! Test Screen !!")),
      body: screenContent(),
    );
  }

  Widget screenContent() {
    return Container
      (
      child: Row(
        children: <Widget>[
          MaterialButton(
            child: Text("loadFromFile"),
            onPressed: (() {
              SaveManager.loadLevelSaveData();
            }),
          ),
        ],
      ),
    );
  }




}


