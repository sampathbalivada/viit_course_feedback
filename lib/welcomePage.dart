import 'package:flutter/material.dart';

import './widgets/custom_button.dart';

import './scoped-model/courses_feedback_model.dart';

class WelcomePage extends StatefulWidget {
  final CoursesFeedbackModel model;

  WelcomePage(this.model);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  void initState() {
    widget.model.fetchIndexing();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: _height/4),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            CustomButton(
              title: 'Click Here',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/card');
              },
            ),
          ],
        ),
      ),
    );
  }
}
