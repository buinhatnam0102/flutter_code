import 'package:flutter/material.dart';
import '../model/transaction.dart';
import '../widget/transaction_item.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTx;
  TransactionList(this.transaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? Column(
            children: [Text('Không có Hải ngu ở đây')],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transaction[index], deleteTx: deleteTx);
            },
            itemCount: transaction.length,
          );
  }
}


