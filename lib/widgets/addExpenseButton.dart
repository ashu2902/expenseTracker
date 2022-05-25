import 'package:expense_tracker/Screens/addExpenseScreen.dart';
import 'package:flutter/material.dart';

class AddExpenseButton extends StatelessWidget {
  const AddExpenseButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.white))),
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddExpenseScreen()));
        },
        child: Row(
          children: const [
            Icon(
              Icons.add,
              color: Color(0xffC1FC00),
            ),
            Text(
              "Add Expense",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
