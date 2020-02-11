import 'package:auto_size_text/auto_size_text.dart';
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
            AutoSizeText('Welcome',
                style: TextStyle(fontSize: 60), maxLines: 1),
            SizedBox(
              height: 20,
            ),
            ScopedModelDescendant(
              builder: (BuildContext context, Widget widget,
                  CoursesFeedbackModel model) {
                return model.isLoading
                    ? CircularProgressIndicator()
                    : RaisedButton(
                        child: AutoSizeText(
                          'Click Here',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                          maxLines: 1,
                        ),
                        color: Theme.of(context).accentColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        onPressed: () {
                          // model.setSelectedValue('');
                          // Navigator.pushReplacementNamed(context, '/card');
                          Navigator.pushReplacementNamed(context, '/card');
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
