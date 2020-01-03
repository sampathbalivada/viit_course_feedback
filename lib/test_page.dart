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
      appBar: buildAppBar(),
      body: Center(
        child: Container(
          width: 400,
          child: Column(
            children: <Widget>[
              DetailsTable(details: <String, String>{
                'Abcdef' : 'B',
                'Bcdefg' : 'B',
                'Cdefgh' : 'B',
                'Dhijkl' : 'B',
              }),
            ],
          ),
        ),
      ),
    );
  }
}
