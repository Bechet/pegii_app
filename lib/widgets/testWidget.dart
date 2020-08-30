import 'package:flutter/material.dart';

class TestWidget extends StatefulWidget {
  TestWidget({Key key}) : super(key: key);

  @override
  TestWidgetState createState() => TestWidgetState();
}

class TestWidgetState extends State<TestWidget> {
  int counter = 1;

  void add() {
    setState(() {
      counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("updated child, $counter");
    return Center(
      child: Column(
        children: <Widget>[
          Text("$counter"),
        ],
      ),
    );
  }
}