import 'package:flutter/material.dart';
import 'package:viit_course_feedback/widgets/appbar.dart';
import 'package:viit_course_feedback/widgets/data_input_card.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: DataInputCard(
        subjectName: 'Physics',
        courseOutcomes: [
          'Course Outcome 1',
          'Course Outcome 2',
          'Course Outcome 3',
          'Course Outcome 4',
        ],
        onNextButtonPressed: null,
      ),
    );
  }
}
