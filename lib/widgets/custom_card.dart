import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../scoped-model/courses_feedback_model.dart';

import 'custom_button.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final Widget content;
  final Function onNextButtonPressed;
  final Function onBackButtonPressed;
  final CoursesFeedbackModel model;

  CustomCard(
      {@required this.title,
      @required this.content,
      @required this.onNextButtonPressed,
      this.onBackButtonPressed,
      this.model});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          
          Column(
            children: <Widget>[
              Text(
                "FEEDBACK OF STUDENTS(STAKEHOLDERS) OF ATTAINMENT OF THE",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "PROGRAM SPECIFIC OUTCOMES (PSOs) OF THE UG PROGRAM B.TECH.(CSE)",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "OF THE DEPARTMENT OF COMPUTER SCIENCE AND ENGINEERING",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
          SizedBox(height: 100),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(
                color: Theme.of(context).accentColor,
                width: 2,
              ),
            ),
            child: Container(
              height: _height * 0.5,
              width: _height * 0.6,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    SizedBox(height: _height * 0.05),
                    AutoSizeText(
                      widget.title,
                      maxLines: 1,
                      style: TextStyle(fontSize: 24),
                    ),
                    Divider(
                      height: 4,
                      thickness: 2,
                      color: Theme.of(context).accentColor,
                    ),
                    Flexible(
                      child: widget.content,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 2,
                          child: widget.model.displayBackButton
                              ? CustomButton(
                                  title: 'Back',
                                  onPressed: () {
                                    widget.onBackButtonPressed();
                                    // Navigator.of(context).pop();
                                    // widget.model.resetState();
                                  },
                                )
                              : RaisedButton(
                                  onPressed: null,
                                  disabledColor: Colors.white,
                                  elevation: 0,
                                  child: AutoSizeText(
                                    '',
                                    maxLines: 1,
                                  ),
                                ),
                        ),
                        Flexible(
                          flex: 2,
                          child: CustomButton(
                            title: 'Next',
                            onPressed: () {
                              widget.onNextButtonPressed();
                              // Navigator.pushNamed(context, '/card');
                              // widget.model.resetState();
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
