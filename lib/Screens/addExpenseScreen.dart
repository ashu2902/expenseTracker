import 'dart:developer';

import 'package:expense_tracker/functions.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expensesList.dart';
import 'package:flutter/material.dart';

class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({Key? key}) : super(key: key);

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  TextEditingController amountController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController merchantController = TextEditingController();
  TextEditingController paidViaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: const Text(
          "Add expense",
          style: TextStyle(fontSize: 20, color: Color(0xff3DB8FC)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0, top: 10),
              child: Text(
                  "Record your expenses for them to \nreflect in your categories",
                  style: TextStyle(
                    fontSize: 16,
                  )),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ExpenseField(
                  textController: amountController,
                  title: "Amount",
                  prefix: "₹",
                ),
                ExpenseField(
                  textController: categoryController,
                  title: "Category",
                ),
                ExpenseField(
                  textController: dateController,
                  title: "Date",
                ),
                ExpenseField(
                  textController: merchantController,
                  title: "Merchant",
                ),
                ExpenseField(
                  textController: paidViaController,
                  title: "Paid via",
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 38.0),
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: SizedBox(
                      height: 60,
                      width: wd,
                      child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff3DB8FC))),
                          onPressed: () async {
                            expenseList.add(Expense(
                                amount: double.parse(amountController.text),
                                category: categoryController.text,
                                date: dateController.text,
                                merchant: merchantController.text,
                                paidVia: paidViaController.text));
                            await writeToStorage("expense", expenseList);
                            readFromStorage("expense")
                                .then((value) => print(value.last.amount));
                          },
                          child: const Text(
                            "Done",
                            style: TextStyle(color: Colors.white),
                          ))),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ExpenseField extends StatefulWidget {
  const ExpenseField(
      {required this.title,
      this.prefix,
      required this.textController,
      Key? key})
      : super(key: key);

  @override
  State<ExpenseField> createState() => _ExpenseFieldState();
  final String title;
  final String? prefix;
  final TextEditingController textController;
}

class _ExpenseFieldState extends State<ExpenseField> {
  @override
  Widget build(BuildContext context) {
    var wd = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 60,
        width: wd,
        decoration: const BoxDecoration(color: Color(0xff272729)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(widget.title),
            )),
            Text(widget.prefix == null ? "" : widget.prefix!),
            Flexible(
              child: TextField(
                controller: widget.textController,
                cursorColor: Colors.white,
                decoration: const InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusColor: Colors.white,
                    fillColor: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
