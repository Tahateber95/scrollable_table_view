import 'dart:developer';

import 'package:example/model.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_table_view/scrollable_table_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Scrollable Table View Example'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var columns = products.first.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: ScrollableTableView(
          columnsbBackgroundColor: Colors.grey.shade100,
          columns: [
            ...columns.map((column) {
              return TableViewColumn(
                label: column,
              );
            }).toList(),
            const TableViewColumn(
              label: '',
            ),
            const TableViewColumn(
              label: '',
            )
          ],
          rows: List.generate(
              products.length,
              (index) => TableViewRow(
                      onSelected: () {
                        log(index.toString());
                      },
                      height: 60,
                      cells: [
                        ...columns.map((column) {
                          return TableViewCell(
                            child: Text(products[index][column] ?? ""),
                          );
                        }).toList(),
                        TableViewCell(
                          child: IconButton(
                              onPressed: () {
                                log('pressed at: ' + index.toString());
                              },
                              icon: Icon(Icons.edit)),
                        ),
                        TableViewCell(
                          child: IconButton(
                              onPressed: () {
                                log('pressed at: ' + index.toString());
                              },
                              icon: Icon(Icons.delete)),
                        ),
                      ])),
        ),
      ),
    );
  }
}
