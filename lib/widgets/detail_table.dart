import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DetailsTable extends StatelessWidget {
  // final List<String> title;
  // final List<String> value;
  final Map<String, String> details;

  DetailsTable({@required this.details});

  List<TableRow> buildDetailRows(BuildContext context) {
    List<TableRow> contentList = [];

    // for (var i = 0; i < 4; i++) {
    //   contentList.add(
    //     TableRow(
    //       children: [
    //         Text(
    //           '•',
    //           style: TextStyle(
    //             color: Theme.of(context).accentColor,
    //             fontSize: 48,
    //           ),
    //         ),
    //         Text(title[i]),
    //         SizedBox(width: 2),
    //         Text('-'),
    //         Text(
    //           value[i],
    //           style: TextStyle(color: Theme.of(context).primaryColor),
    //         )
    //       ],
    //     ),
    //   );
    // }

    details.forEach((k, v) {
      contentList.add(
        TableRow(
          children: [
            AutoSizeText(
              '•',
              maxLines: 1,
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 32,
              ),
            ),
            AutoSizeText(
              k,
              maxLines: 1,
            ),
            // SizedBox(width: 2),
            AutoSizeText(' -', maxLines: 1),
            AutoSizeText(
              v,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
              maxLines: 1,
              // style: TextStyle(color: Theme.of(context).primaryColor),
            )
          ],
        ),
      );
    });
    // print(contentList);
    return contentList;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 48, right: 48, top: 25),
      child: ListView(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: buildDetailRows(context),
          ),
        ],
      ),
    );
  }
}
