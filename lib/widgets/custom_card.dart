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
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: _height * 0.5,
          width: _height * 0.6,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(height: _height * 0.05),
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 24),
                ),
                Divider(
                  height: 4,
                  thickness: 2,
                  color: Theme.of(context).primaryColor,
                ),
                Flexible(
                  child: widget.content,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    widget.model.displayBackButton
                        ? CustomButton(
                            title: 'Back',
                            onPressed: () {
                              widget.onBackButtonPressed();
                              // Navigator.of(context).pop();
                              // widget.model.resetState();
                            },
                          )
                        : Container(),
                    CustomButton(
                      title: 'Next',
                      onPressed: () {
                        widget.onNextButtonPressed();
                        // Navigator.pushNamed(context, '/card');
                        // widget.model.resetState();
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
