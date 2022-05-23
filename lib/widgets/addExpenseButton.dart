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
                    side: BorderSide(color: Colors.white))),
            backgroundColor: MaterialStateProperty.all(Colors.black)),
        onPressed: () {},
        child: Row(
          children: const [
            Icon(
              Icons.add_circle_outline_rounded,
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
