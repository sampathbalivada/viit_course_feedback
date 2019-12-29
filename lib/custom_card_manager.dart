import 'package:flutter/material.dart';

import './widgets/custom_card.dart';

// import 'package:scoped_model/scoped_model.dart';
import './scoped-model/courses_feedback_model.dart';

class CustomCardManager extends StatefulWidget {
  final CoursesFeedbackModel model;

  CustomCardManager(this.model);

  @override
  _CustomCardManagerState createState() => _CustomCardManagerState();
}

class _CustomCardManagerState extends State<CustomCardManager> {
  @override
  void initState() {
    widget.model.fetchIndexing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Choose you Regulation',
      content: Container(),
      onNextButtonPressed: () {},
      onBackButtonPressed: () {
        print("Hello World!");
      },
    );
  }
}
