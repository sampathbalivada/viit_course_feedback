import 'package:flutter/material.dart';

import '../scoped-model/courses_feedback_model.dart';

class CardContent extends StatefulWidget {
  final CoursesFeedbackModel model;

  CardContent(this.model);

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  List<String> contentList = [];

  @override
  void initState() {
    contentList = widget.model.getContentList;
    super.initState();
  }

  void _buildRadioList() {
    // fill this
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ,
    );
  }
}
