import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String title;
  final String value;

  DetailsRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.check_circle_outline,
          color: Colors.lightGreen,
        ),
        SizedBox(
          width: 10,
        ),
        Text(title.padRight(10) + '   -   ' + value.padLeft(10))
      ],
    );
  }
}
