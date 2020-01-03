import 'package:flutter/material.dart';

import 'custom_button.dart';

class DataInputCard extends StatefulWidget {
  final String subjectName;
  final Function onNextButtonPressed;
  final List<String> courseOutcomes;

  DataInputCard(
      {@required this.subjectName,
      @required this.onNextButtonPressed,
      @required this.courseOutcomes});

  @override
  _DataInputCardState createState() => _DataInputCardState();
}

class _DataInputCardState extends State<DataInputCard> {
  List<double> sliderValues = [0, 0, 0, 0];

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
                  child: Text(
                    'Year - 3',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: Text(
                    'Semester - 1',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                VerticalDivider(
                  color: Theme.of(context).accentColor,
                ),
                Flexible(
                  child: Text(
                    '17L31A05T8',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: Card(
              margin: EdgeInsets.only(bottom: _height * 0.05),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  color: Theme.of(context).accentColor,
                  width: 2,
                ),
              ),
              child: Container(
                width: _width * 0.95,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(height: _height * 0.05),
                      Text(
                        widget.subjectName,
                        style: TextStyle(fontSize: 24),
                      ),
                      Divider(
                        height: 4,
                        thickness: 2,
                        color: Theme.of(context).accentColor,
                        indent: _width * 0.3,
                        endIndent: _width * 0.3,
                      ),
                      Flexible(
                        child: ListView.builder(
                          padding: EdgeInsets.only(
                            left: _width * 0.1,
                            right: _width * 0.1,
                            top: _height * 0.08,
                            bottom: _height * 0.08,
                          ),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Flexible(
                                  flex: 2,
                                  child: Text(
                                    '•',
                                    style: TextStyle(
                                        color: Theme.of(context).accentColor,
                                        fontSize: 48),
                                  ),
                                ),
                                Flexible(
                                  flex: 4,
                                  child: Text(
                                    widget.courseOutcomes[index],
                                    style: TextStyle(fontSize: 18),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Flexible(
                                  flex: 2,
                                  child: Slider(
                                    label: sliderValues[index].toString(),
                                    divisions: 3,
                                    max: 3,
                                    value: sliderValues[index].toDouble(),
                                    activeColor: Theme.of(context).accentColor,
                                    onChanged: (newValue) {
                                      setState(() {
                                        sliderValues[index] = newValue;
                                      });
                                    },
                                  ),
                                ),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: BorderSide(
                                      color: Theme.of(context).accentColor,
                                    ),
                                  ),
                                  child: Container(
                                    width: 24,
                                    child: Center(
                                      child: Text(
                                        ' ' + sliderValues[index].toString() + ' ',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Flexible(child: Container()),
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
