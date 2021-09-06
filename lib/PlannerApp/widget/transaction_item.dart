import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';
class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ListTile(
        leading: CircleAvatar(
          radius: 40,
          child: Padding(
              padding: EdgeInsets.all(10),
              child: FittedBox(
                  child: Text(
                      '\$${transaction.amount.toStringAsFixed(2)}'))),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle:
        Text(DateFormat.yMMMd().format(transaction.date)),
        trailing: MediaQuery.of(context).size.width > 400
            ? TextButton.icon(
          label: Text('Delete'),
          icon: Icon(
            Icons.delete,
          ),
          onPressed: () => deleteTx(transaction.id),
        )
            : IconButton(
          color: Theme.of(context).primaryColor,
          icon: Icon(
            Icons.delete,
          ),
          onPressed: () => deleteTx(transaction.id),
        ),
      ),
    );
  }
}