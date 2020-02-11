import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:viit_course_feedback/widgets/submission_alert.dart';

// import 'custom_button.dart';

import './data_input_button.dart';

import '../scoped-model/courses_feedback_model.dart';

class DataInputCard extends StatefulWidget {
  // final String subjectName;
  // final Function onNextButtonPressed;
  // final List<String> courseOutcomes;

  // DataInputCard(
  //     {@required this.subjectName,
  //     @required this.onNextButtonPressed,
  //     @required this.courseOutcomes});

  final CoursesFeedbackModel model;

  DataInputCard(this.model);

  // String subjectName;
  // Function onNextButtonPressed;
  // List<String> courseOutcomes;

  @override
  _DataInputCardState createState() => _DataInputCardState();
}

class _DataInputCardState extends State<DataInputCard> {
  List<double> sliderValues = [0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    if (widget.model.presentSubjectIndex == widget.model.courseIndex.length) {
      Timer(Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, '/semestersPage');
      });

      return SubmissionAlert('Submission Successfull');
    }

    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: _height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: AutoSizeText(
                    'Year - ' + widget.model.clickedSemester[0],
                    // 'Year',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: AutoSizeText(
                    'Semester - ' + widget.model.clickedSemester[2],
                    // 'Semester',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: AutoSizeText(
                    widget.model.finalEnteryDetails['RollNumber'],
                    // '17L31A0501',
                    maxLines: 1,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Card(
              margin: EdgeInsets.only(bottom: _height * 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).accentColor,
                  width: 2,
                ),
              ),
              child: Container(
                width: _width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: _height * 0.05),
                      AutoSizeText(
                        widget.model.presentSubjectName,
                        style: TextStyle(fontSize: 24),
                        maxLines: 1,
                      ),
                      Divider(
                        height: 4,
                        thickness: 2,
                        color: Theme.of(context).accentColor,
                        indent: _width * 0.3,
                        endIndent: _width * 0.3,
                      ),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: _width * 0.1,
                            right: _width * 0.1,
                            top: _height * 0.05,
                            bottom: _height * 0.05,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            // print(widget.model.courseOutcomes[index]);
                            // print();
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: AutoSizeText(
                                    '•',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 48),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: AutoSizeText(
                                    widget.model.courseOutcomes[index],
                                    style: TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Slider(
                                    label: sliderValues[index].toString(),
                                    divisions: 3,
                                    max: 3,
                                    value: sliderValues[index].toDouble(),
                                    activeColor: Theme.of(context).accentColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        sliderValues[index] = newValue;
                                      });
                                    },
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: BorderSide(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  child: Container(
                                    width: 24,
                                    child: Center(
                                      child: AutoSizeText(
                                        ' ' +
                                            sliderValues[index].toString() +
                                            ' ',
                                        style: TextStyle(fontSize: 18),
                                        maxLines: 1,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.05),
                            buildText(context, '0 - Poor'),
                            buildText(context, '|'),
                            buildText(context, '1 - Average'),
                            buildText(context, '|'),
                            buildText(context, '2 - Good'),
                            buildText(context, '|'),
                            buildText(context, '3 - Excellent'),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6)
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(child: Container()),
                          DetailsButton(
                            title: 'Next',
                            onPressed: () {
                              widget.model.onNextInputButton(sliderValues);
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AutoSizeText buildText(BuildContext context, String data) {
    return AutoSizeText(
      data,
      style: TextStyle(color: Theme.of(context).accentColor, fontSize: 18),
      maxLines: 1,
    );
  }
}
