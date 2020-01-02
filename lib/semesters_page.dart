import 'package:flutter/material.dart';

import './widgets/semester_content.dart';
import './widgets/appbar.dart';

import './scoped-model/courses_feedback_model.dart';
import 'package:scoped_model/scoped_model.dart';

class SemestersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: buildAppBar(),
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Container(
            height: _height * 0.5,
            width: _height * 0.6,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: _height * 0.05),
                  Text(
                    'SEMESTERS',
                    style: TextStyle(fontSize: 24),
                  ),
                  Divider(
                    height: 4,
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  Flexible(
                    // child: widget.content,
                    child: ScopedModelDescendant(
                      builder: (BuildContext context, Widget widget, CoursesFeedbackModel model) {
                        return SemesterContent(model, _height * 0.5);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
