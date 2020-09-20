import 'package:flutter/material.dart';

class StarRow extends StatefulWidget {
  int min;
  int max;

  StarRow({this.min, this.max});

  @override
  _StarRowState createState() => _StarRowState(min, max);
}

class _StarRowState extends State<StarRow> {
  int min;
  int max;

  _StarRowState(int min, int max) {
    this.min = min;
    this.max = max;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for ( int i=1; i<= min; i++ ) Icon(
              Icons.star,
            color: Colors.yellow[600],
          ),
          for ( int i=min; i< max; i++ ) Icon(
              Icons.star_border,
            color: Colors.yellow[500],
          ),
        ],
      ),
    );
  }
}
