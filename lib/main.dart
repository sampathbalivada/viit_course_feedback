import 'package:flutter/material.dart';
import 'package:viit_course_feedback/widgets/custom_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff3949AB),
        fontFamily: 'Poppins' 
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Image.asset(
              //   'vignan_logo.png',
              //   fit: BoxFit.contain,
              // ),
              Text('VIIT COURSES FEEDBACK')
            ],
          ),
        ),
        body: CustomCard(
          title: 'Choose you Regulation',
          content: Container(),
          onNextButtonPressed: () {},
          onBackButtonPressed: () {
            print("Hello World!");
          },
        ),
      ),
    );
  }
}
