import 'package:flutter/material.dart';

class SubmissionAlert extends StatelessWidget {
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
                'Submission Successfull',
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
