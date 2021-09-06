import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_xxx/PlannerApp/widget/chart.dart';
import 'package:flutter_xxx/PlannerApp/widget/new_transaction.dart';

import 'model/transaction.dart';
import 'widget/transaction_list.dart';

// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // SystemChrome.setPreferredOrientations([
//   //   DeviceOrientation.portraitUp,
//   //   DeviceOrientation.portraitDown
//   // ]);
//   runApp(PlannerApp());
// }

class PlannerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Expense Planner",
      theme: ThemeData(primarySwatch: Colors.indigo, fontFamily: 'Poppins'),
      home: MyPlannerApp(),
    );
  }
}

class MyPlannerApp extends StatefulWidget {
  @override
  _MyPlannerAppState createState() => _MyPlannerAppState();
}

class _MyPlannerAppState extends State<MyPlannerApp> {
  final List<Transaction> _userTransaction = [
    // Transaction(
    //     id: "1", title: "New Shoes", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: "2", title: "New House", amount: 111169.99, date: DateTime.now())
  ];
  bool _showChar = false;

  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(String title, double amount, DateTime chosenDate) {
    final newTx = Transaction(
        title: title,
        amount: amount,
        date: chosenDate,
        id: DateTime.now().toString());
    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {},
              child: NewTransaction(_addNewTransaction));
        });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final appBar = AppBar(
      title: Text('Planner'),
      actions: [
        IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(Icons.add))
      ],
    );
    final mediaQuery = MediaQuery.of(context);
    final _isLandscape =
        mediaQuery.orientation == Orientation.landscape;
    final txListWg = Container(
        height: (size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            .7,
        child: TransactionList(_userTransaction, _deleteTransaction));

    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            if (_isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Show Chart'),
                  Switch(
                      value: _showChar,
                      onChanged: (val) {
                        setState(() {
                          _showChar = val;
                        });
                      })
                ],
              ),
            if (_isLandscape)
              _showChar
                  ? Container(
                      height: (size.height -
                              appBar.preferredSize.height -
                              mediaQuery.padding.top) *
                          .7,
                      child: Chart(_recentTransaction))
                  : txListWg,
            if (!_isLandscape)
              Container(
                  height: (size.height -
                          appBar.preferredSize.height -
                          mediaQuery.padding.top) *
                      .3,
                  child: Chart(_recentTransaction)),
            if (!_isLandscape) txListWg
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
