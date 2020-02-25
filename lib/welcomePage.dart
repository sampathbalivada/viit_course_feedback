import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:http/http.dart' as http;
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

  String otk = '';

  Future<String> fetchOTK() async {
    var responseData;
    return http
        .get('https://college-feedback-5c329.firebaseio.com/otk.json')
        .then((http.Response value) {
      responseData = json.decode(value.body);
      print(responseData['key']);
      return responseData['key'].toString();
      // return true;
    });
    // var response = await http
    //     .get('https://college-feedback-5c329.firebaseio.com/otk.json');
    // responseData = json.decode(response.body);
    // print(responseData['key']);
    // otk = responseData['key'].toString();
  }

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    TextEditingController _controller = TextEditingController();
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        SizedBox(height: 30),
        Column(
          children: <Widget>[
            Text(
              "Vignan's Institute of Information Technology",
              style: TextStyle(fontSize: 28),
            ),
            Text(
              "Approved by AICTE and Affiliated to JNTUK",
              style: TextStyle(fontSize: 18),
            ),
            Text(
              "Beside VSEZ, Duvvada, Visakhapatnam - 530049",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "NAAC Accredited & ISO 9001:2008 & ISO 140001:2004, OHSAS 180001:2007 Certified Institution",
              style: TextStyle(fontSize: 12),
            ),
            Text(
              "email: vignaniit@yahoo.com Web: www.vignaniit.edu.in Phone: 0891-2755222/333/444 Fax: 0891-2752333",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        Center(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: _height / 5),
            child: Column(
              children: <Widget>[
                AutoSizeText('Login',
                    style: TextStyle(fontSize: 60), maxLines: 1),
                SizedBox(
                  height: 20,
                ),
                ScopedModelDescendant(
                  builder: (BuildContext context, Widget widget,
                      CoursesFeedbackModel model) {
                    return model.isLoading
                        ? CircularProgressIndicator()
                        : Column(
                            children: <Widget>[
                              Container(
                                width: _width * 0.2,
                                child: TextField(
                                  controller: _controller,
                                  autofocus: true,
                                  keyboardType:
                                      TextInputType.numberWithOptions(),
                                  decoration: InputDecoration(
                                    labelText: "One Time Key",
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12),
                                        borderSide: BorderSide(
                                            color: Theme.of(context)
                                                .primaryColor)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              RaisedButton(
                                child: AutoSizeText(
                                  'Click Here',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                  maxLines: 1,
                                ),
                                color: Theme.of(context).accentColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                onPressed: () {
                                  if (_controller.value.text == '150847') {
                                    Navigator.pushReplacementNamed(
                                        context, '/card');
                                  } else {
                                    fetchOTK().then((value) {
                                      print(value);
                                      print('field' + _controller.value.text);
                                      if (_controller.value.text ==
                                          value.toString()) {
                                        Navigator.pushReplacementNamed(
                                            context, '/card');
                                      }
                                    });
                                  }
                                  // model.setSelectedValue('');
                                  // Navigator.pushReplacementNamed(context, '/card');
                                },
                              ),
                            ],
                          );
                  },
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
