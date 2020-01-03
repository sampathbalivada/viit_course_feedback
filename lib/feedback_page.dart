import 'package:flutter/material.dart';

import './widgets/appbar.dart';
import './widgets/data_input_card.dart';

import './scoped-model/courses_feedback_model.dart';

import 'package:scoped_model/scoped_model.dart';

class FeedBackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ScopedModelDescendant(
        builder:
            (BuildContext context, Widget widget, CoursesFeedbackModel model) {
          return DataInputCard(model);
        },
      ),
    );
  }
}
