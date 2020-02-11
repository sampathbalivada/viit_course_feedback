import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../scoped-model/courses_feedback_model.dart';

import '../feedback_page.dart';

class SemesterContent extends StatelessWidget {
  final CoursesFeedbackModel model;
  final width;

  SemesterContent(this.model, this.width);

  _buildSemButton(String value, BuildContext context) {
    return RaisedButton(
      disabledColor: Color(0xFFD1C4E9),
      color: Theme.of(context).accentColor,
      child: AutoSizeText(
        value[0] + ' - ' + value[2],
        maxLines: 1,
        style: TextStyle(
          fontSize: 24,
          color: Colors.white,
        ),
      ),
      onPressed: model.isFilled[value]
          ? null
          : () {
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
    return
        // model.isLoading
        // ? Center(
        //     child: CircularProgressIndicator(),
        //   )
        // :
        Container(
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
