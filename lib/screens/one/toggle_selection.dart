import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ToggleSelection extends StatefulWidget {
  const ToggleSelection({super.key});

  @override
  State<ToggleSelection> createState() => _ToggleSelectionState();
}

class _ToggleSelectionState extends State<ToggleSelection> {
  bool isAdd = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            SizedBox(height: 60),
            CircleAvatar(
              radius: 140,
              backgroundImage: AssetImage("assets/images/person.png!sw800"),
            ),
            Positioned(
              bottom: 15,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isAdd = !isAdd;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: isAdd
                      ? CupertinoColors.activeGreen
                      : CupertinoColors.systemRed,
                  child: Icon(
                    isAdd ? Icons.done : Icons.add,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
