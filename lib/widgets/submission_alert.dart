// import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SubmissionAlert extends StatelessWidget {
  final String title;

  SubmissionAlert(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).accentColor,
              width: 2,
            ),
          ),
          content: Row(
            children: <Widget>[
              Text(
                title,
                // maxLines: 1,
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(width: 12),
              Icon(Icons.done_all, color: Theme.of(context).accentColor)
            ],
          ),
        ),
      ),
    );
  }
}
