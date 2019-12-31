import 'package:flutter/material.dart';

import 'custom_button.dart';

class DataInputCard extends StatefulWidget {
  final String title;
  final Widget content;
  final Function onNextButtonPressed;

  DataInputCard(
      {@required this.title,
      @required this.content,
      @required this.onNextButtonPressed});

  @override
  _DataInputCardState createState() => _DataInputCardState();
}

class _DataInputCardState extends State<DataInputCard> {
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;

    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: _height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  child: Text('Year - 3'),
                ),
                VerticalDivider(
                  color: Theme.of(context).primaryColor,
                ),
                Flexible(
                  child: Text('Semester - 1'),
                ),
                VerticalDivider(
                  color: Theme.of(context).primaryColor,
                ),
                Flexible(child: Text('17L31A05T8')),
              ],
            ),
          ),
          Flexible(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              child: Container(
                width: _width * 0.95,
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
                        children: <Widget>[
                          Flexible(
                            child: Container()
                          ),                                           
                          CustomButton(
                            title: 'Next',
                            onPressed: widget.onNextButtonPressed,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
