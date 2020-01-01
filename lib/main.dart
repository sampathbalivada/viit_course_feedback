import 'package:flutter/material.dart';

import './welcomePage.dart';
import './custom_card_manager.dart';

import 'package:scoped_model/scoped_model.dart';
import './scoped-model/courses_feedback_model.dart';

void main()  {
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
        theme:
            ThemeData(primaryColor: Color(0xff3949AB), fontFamily: 'Poppins'),
        routes: {
          '/card': (BuildContext context) => CustomCardManager(),
        },
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Image(
                  image: AssetImage('assets/vignan_logo.png'),
                   height: 40,
                   width: 40,
                   fit: BoxFit.contain,
                ),
                SizedBox(
                  width: 10,
                  height: 10,
                ),
                Text('VIIT COURSES FEEDBACK')
                ],
            ),
          ),
          body: WelcomePage(_model),
        ),
      ),
    );
  }
}
