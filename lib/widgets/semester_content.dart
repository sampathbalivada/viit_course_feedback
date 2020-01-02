import 'package:flutter/material.dart';

import '../scoped-model/courses_feedback_model.dart';

class SemesterContent extends StatelessWidget {
  final CoursesFeedbackModel model;
  final width;

  SemesterContent(this.model, this.width);

  _buildSemButton(String value) {
    // return Column(
    //   children: <Widget>[
    //     RaisedButton(
    //       color: Colors.purple.shade300,
    //       child: Text(
    //         value,
    //         // style: TextStyle(
    //         //   color: Colors.white,
    //         // ),
    //       ),
    //       onPressed: () {},
    //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    //     ),
    //     SizedBox(
    //       height: 5,
    //     )
    //   ],
    // );

    return RaisedButton(
      color: Colors.purple.shade100,
      child: Text(
        value,
        style: TextStyle(
          fontSize: 24,
        ),
      ),
      onPressed: () {},
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
            _buildSemButton(model.allSemesters[index]),
        itemCount: model.allSemesters.length,
      ),
    );
  }
}
