import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

// import './widgets/custom_button.dart';

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
        padding: EdgeInsets.symmetric(vertical: _height / 4),
        child: Column(
          children: <Widget>[
            Text(
              'Welcome',
              style: TextStyle(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            ScopedModelDescendant(
              builder: (BuildContext context, Widget widget,
                  CoursesFeedbackModel model) {
                return model.isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: Text(
                          'Click Here',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          // model.setSelectedValue('');
                          // Navigator.pushReplacementNamed(context, '/card');
                          Navigator.pushNamed(context, '/card');
                        },
                      );
              },
            )
          ],
        ),
      ),
    );
  }
}
