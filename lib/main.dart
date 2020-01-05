import 'package:flutter/material.dart';
import 'package:viit_course_feedback/test_page.dart';

import './welcomePage.dart';
import './custom_card_manager.dart';
import './semesters_page.dart';
import './widgets/appbar.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped-model/courses_feedback_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final CoursesFeedbackModel _model = CoursesFeedbackModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<CoursesFeedbackModel>(
      model: _model,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff3949AB),
          accentColor: Color(0xff673AB7),
          fontFamily: 'Poppins',
        ),
        routes: {
          '/card': (BuildContext context) => CustomCardManager(),
          '/semestersPage': (BuildContext context) => SemestersPage(_model),
          // '/testPage': (BuildContext context) => TestPage()
        },
        home: AppHome(
          model: _model,
        ),
      ),
    );
  }
}

class AppHome extends StatelessWidget {
  final model;

  AppHome({@required this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: WelcomePage(model),
      // // Uncomment these lines to display test page button - Use for Widget Tests
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context).pushNamed('/testPage');
      //   },
      //   child: Text('Test'),
      // ),
    );
  }
}
