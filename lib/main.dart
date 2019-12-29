import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xff3949AB)),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(162),
          child: AppBar(
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Image.asset(
                //   'vignan_logo.png',
                //   fit: BoxFit.contain,
                // ),
                Text('VIIT COURSES FEEDBACK')
              ],
            ),
          ),
        ),
        body: Container(),
      ),
    );
  }
}
