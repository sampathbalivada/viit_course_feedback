import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './widgets/custom_card.dart';
import './widgets/card_content.dart';
import './widgets/appbar.dart';

import './scoped-model/courses_feedback_model.dart';

class CustomCardManager extends StatefulWidget {
  @override
  _CustomCardManagerState createState() => _CustomCardManagerState();
}

class _CustomCardManagerState extends State<CustomCardManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: ScopedModelDescendant(
        builder:
            (BuildContext context, Widget widget, CoursesFeedbackModel model) {
          return CustomCard(
            title:
                model.presentInput == 'Here are your details, check them once'
                    ? model.presentInput
                    : 'Choose your ' + model.presentInput,
            content: CardContent(model),
            onNextButtonPressed: model.presentInput ==
                    'Here are your details, check them once'
                ? () {
                    // model.onNextButtonPressed();
                    model.extractSemesters();
                    Navigator.pushReplacementNamed(context, '/semestersPage');
                  }
                : model.onNextButtonPressed,
            onBackButtonPressed: model.onBackButtonPressed,
            model: model,
          );
        },
      ),
    );
  }
}
