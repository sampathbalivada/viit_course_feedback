import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../scoped-model/courses_feedback_model.dart';

class CardContent extends StatefulWidget {
  final CoursesFeedbackModel model;

  CardContent(this.model);

  @override
  _CardContentState createState() => _CardContentState();
}

class _CardContentState extends State<CardContent> {
  List<String> contentList = [];
  String _selectedOption = '';

  @override
  void initState() {
    contentList = widget.model.getContentList;
    super.initState();
  }

  _buildListViewForSelectedContent(CoursesFeedbackModel model) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ListTile(
        leading: Radio(
          groupValue: _selectedOption,
          onChanged: (String value) {
            setState(() {
              _selectedOption = value;
              model.fillFinalEnteries(_selectedOption);
            });
          },
          value: model.getContentList[index],
        ),
        title: Text(model.getContentList[index]),
      ),
      itemCount: model.getContentList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder:
          (BuildContext context, Widget widget, CoursesFeedbackModel model) {
        return Container(
          child: _buildListViewForSelectedContent(model),
        );
      },
    );
  }
}
