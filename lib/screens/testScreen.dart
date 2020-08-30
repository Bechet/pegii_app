import 'package:flutter/material.dart';
import 'package:pegii_app/RandomUtils.dart';
import 'package:pegii_app/bean/janken.dart';
import 'package:pegii_app/bean/jankenState.dart';
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
    return Center(
      child:
        Column(
          children: <Widget>[
            TestWidget(key: testWidget),
            IconButton(
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                setState(() {
                  testWidget.currentState.add();
                });
              },
            ),
          ],
        ),
    );
  }
}


