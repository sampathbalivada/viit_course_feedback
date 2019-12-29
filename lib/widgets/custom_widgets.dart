import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final String title;
  final Widget content;
  final Function onNextButtonPressed;
  final Function onBackButtonPressed;

  CustomCard(
      {@required this.title,
      @required this.content,
      @required this.onNextButtonPressed,
      this.onBackButtonPressed});

  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool showProgressBar = false;

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;

    return Center(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: _height * 0.5,
          width: _height * 0.5,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    widget.onBackButtonPressed != null
                        ? RaisedButton(
                            color: Color(0xFF3949AB),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Text(
                              ' Back ',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            ),
                            onPressed: widget.onBackButtonPressed,
                          )
                        : Container(),
                    RaisedButton(
                      color: Color(0xFF3949AB),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        'Next',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                      onPressed: widget.onNextButtonPressed,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
