import 'package:flutter/material.dart';

class DetailsRow extends StatelessWidget {
  final String title;
  final String value;

  DetailsRow(this.title, this.value);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: <TableRow>[
        TableRow(
          children: [
            Text(
              '•',
              style: TextStyle(
                color: Theme.of(context).accentColor,
                fontSize: 48,
              ),
            ),
            Text(title),
            SizedBox(width: 2),
            Text('-'),
            Text(value, style: TextStyle(color: Theme.of(context).primaryColor))
          ],
        )
      ],
    );
  }
}
