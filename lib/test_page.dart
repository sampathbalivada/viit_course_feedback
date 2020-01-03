import 'package:flutter/material.dart';
import 'package:viit_course_feedback/widgets/appbar.dart';
import 'package:viit_course_feedback/widgets/detail_table.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
