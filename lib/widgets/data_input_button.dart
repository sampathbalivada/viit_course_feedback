import 'package:flutter/material.dart';

class DetailsButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  DetailsButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).accentColor,
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(width: 2),
      ),
      child: Text(
        title,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      onPressed: onPressed,
    );
  }
}
