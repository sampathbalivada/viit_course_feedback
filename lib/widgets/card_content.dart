import 'package:flutter/material.dart';
// import 'package:scoped_model/scoped_model.dart';

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

  // String dropDownValue = '';

  @override
  void initState() {
    contentList = widget.model.getContentList;
    // print(contentList);
    super.initState();
  }

  _buildListViewForSelectedContent(CoursesFeedbackModel model) {
    // print(model.getContentList);
    // print('content: ' + model.getContentList.toString());
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
        onTap: () {
          setState(() {
            _selectedOption = '';
          });
        },
      ),
      itemCount: model.getContentList.length,
    );
  }

  _buildDropDownMenu(CoursesFeedbackModel model) {
    // print(model.getContentList[10]);

    return Container(
      height: 300,
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          value: model.selectedRollNumber,
          onChanged: (String value) {
            setState(() {
              model.setSelectedRollNumber(value);
              model.fillFinalEnteries(value);
              // print(_selectedOption);
            });
          },
          items: model.getContentList
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print('Hehe');
    return Container(
      child: widget.model.presentInput == 'Registration Number'
          ? _buildDropDownMenu(widget.model)
          : _buildListViewForSelectedContent(widget.model),
    );
  }
}
