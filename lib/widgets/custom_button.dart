import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-model/courses_feedback_model.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onPressed;

  CustomButton({@required this.title, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder:
          (BuildContext context, Widget widget, CoursesFeedbackModel model) {
        return RaisedButton(
          color: Theme.of(context).accentColor,
          disabledColor: Colors.grey,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          onPressed: (model.selectedOption == '' || model.disableButton || model.getFinalPresentEntry == '' || model.isLoading) && (title == 'Next') ? null : onPressed,
        );
      },
    );
  }
}
