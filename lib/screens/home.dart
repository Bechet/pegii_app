
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peggy Janken"),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Center(
        child: MaterialButton(
          child: Text("Play !"),
          onPressed: (() {
            print("playing...");
            Navigator.pushNamed(context, '/listLevel');
          }),
        ),
      )
    );
  }
}
