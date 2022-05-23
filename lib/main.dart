import 'package:expense_tracker/themes/themes.dart';
import 'package:expense_tracker/widgets/favCategories.dart';
import 'package:expense_tracker/widgets/header.dart';
import 'package:expense_tracker/widgets/totalSpentCard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Zerobalance Flutter Assignment',
      theme: ThemeClass.darkTheme,
      home: const MyHomePage(title: 'Zerobalance Flutter Assignment'),
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
    return Scaffold(
        appBar: AppBar(
          title: Image.asset("assets/logo.png"),
          actions: [
            Image.asset('assets/notification_icon.png'),
            Image.asset('assets/profile_icon.png')
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [HeaderRow(), TotalExpensesCard(), FavCat()],
          ),
        ));
  }
}
