import 'package:flutter/material.dart';
import 'package:sqflite_example/di/service_locator.dart';
import 'package:sqflite_example/screens/item_list_view.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sqflite Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ItemListView(),
    );
  }
}
