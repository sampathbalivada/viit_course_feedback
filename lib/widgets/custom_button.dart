import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  CustomButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Color(0xFF3949AB),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: onPressed,
    );
  }
}
