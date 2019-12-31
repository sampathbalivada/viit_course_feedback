import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import './widgets/custom_card.dart';

import './widgets/card_content.dart';

import './scoped-model/courses_feedback_model.dart';

class CustomCardManager extends StatefulWidget {
  @override
  _CustomCardManagerState createState() => _CustomCardManagerState();
}

class _CustomCardManagerState extends State<CustomCardManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            // Image.asset(
            //   'vignan_logo.png',
            //   fit: BoxFit.contain,
            // ),
            Text('VIIT COURSES FEEDBACK')
          ],
        ),
      ),
      body: ScopedModelDescendant(
        builder:
            (BuildContext context, Widget widget, CoursesFeedbackModel model) {
          return CustomCard(
            title: 'Choose your ' + model.presentInput,
            content: CardContent(model),
            onNextButtonPressed: model.onNextButtonPressed,
            onBackButtonPressed: model.onBackButtonPressed,
            model: model,
          );
        },
      ),
    );
  }
}
