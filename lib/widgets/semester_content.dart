import 'package:flutter/material.dart';

import '../scoped-model/courses_feedback_model.dart';

import '../feedback_page.dart';

class SemesterContent extends StatelessWidget {
  final CoursesFeedbackModel model;
  final width;

  SemesterContent(this.model, this.width);

  _buildSemButton(String value, BuildContext context) {
    return RaisedButton(
      color: Colors.purple.shade100,
      child: Text(
        value,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onPressed: () {
        // send clicked semester to scoped model
        model.setClickedSemester(value);
        // push replacement to feedback page
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => FeedBackPage()));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: width,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            _buildSemButton(model.allSemesters[index], context),
        itemCount: model.allSemesters.length,
      ),
    );
  }
}
