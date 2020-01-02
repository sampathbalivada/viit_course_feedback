import 'package:flutter/material.dart';

import './widgets/semester_content.dart';

class SemestersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
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
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
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
                    'SEMESTERS',
                    style: TextStyle(fontSize: 24),
                  ),
                  Divider(
                    height: 4,
                    thickness: 2,
                    color: Theme.of(context).primaryColor,
                  ),
                  Flexible(
                    // child: widget.content,
                    child: SemesterContent(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
