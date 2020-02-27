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
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width * 0.95,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                buildText(context, '0 - Poor'),
                buildText(context, '|'),
                buildText(context, '1 - Fair'),
                buildText(context, '|'),
                buildText(context, '2 - Good'),
                buildText(context, '|'),
                buildText(context, '3 - Very Good'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.6)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(BuildContext context, String data) {
    return Text(
      data,
      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
    );
  }
}
