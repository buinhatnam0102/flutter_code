import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx) {
    print('Constructor NewTransaction Widget');
  }

  @override
  _NewTransactionState createState() {
    print('CreateState NewTransaction Widget');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  DateTime _pickedDate;

  _NewTransactionState() {
    print('Constructor NewTransaction State');
  }
@override
  void initState() {
    print('initState');
    // TODO: implement initState
    super.initState();
  }
  @override
  void didUpdateWidget(covariant NewTransaction oldWidget) {
    // TODO: implement didUpdateWidget
    print('didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose');
    super.dispose();
  }
  void _submitData() {
    var enteredTitle = titleController.text;
    var enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || _pickedDate == null) {
      return;
    }

    widget.addTx(
      enteredTitle,
      enteredAmount,
      _pickedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((picked) {
      if (picked == null) {
        return;
      } else
        setState(() {
          _pickedDate = picked;
        });
      print(_pickedDate);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
              right: 10,
              top: 10,
              left: 10,
              bottom: MediaQuery.of(context).viewInsets.bottom + 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: titleController,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) {
                //   titleInput = val;
                // },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(_pickedDate == null
                        ? 'No Date Chosen ! '
                        : 'Picked Date : ${DateFormat.yMMMd().format(_pickedDate)}'),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker, child: Text('Choose'))
                ],
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
