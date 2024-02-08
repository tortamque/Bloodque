import 'package:flutter/material.dart';

class AllHistoryButton extends StatelessWidget {
  const AllHistoryButton({super.key});

  @override
  Widget build(BuildContext context) => GestureDetector(
    child: const Card(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.history, size: 30,),
            SizedBox(width: 10),
            Text(
              'All History',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
