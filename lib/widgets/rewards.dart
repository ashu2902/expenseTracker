import 'package:expense_tracker/widgets/rewardsCarousel.dart';
import 'package:flutter/material.dart';

class Rewards extends StatelessWidget {
  const Rewards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "popular rewards",
              style: TextStyle(fontSize: 18),
            ),
            TextButton(
                onPressed: () {},
                child: const Text(
                  "explore all",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
        const Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Text(
            "pay with zero balance card",
            style: TextStyle(color: Color(0xff777778)),
          ),
        ),
        const RewardCarousel()
      ],
    );
  }
}
