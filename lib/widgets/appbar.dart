import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    centerTitle: true,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Image(
          image: AssetImage('assets/vignan_logo.png'),
          height: 40,
          width: 40,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: 10,
          height: 10,
        ),
        Text('VIIT COURSES FEEDBACK')
      ],
    ),
  );
}
