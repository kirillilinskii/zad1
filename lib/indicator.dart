import 'package:flutter/material.dart';
import 'date_underline.dart';

class Indicator extends StatelessWidget {
  final int orangeBox;
  final int greyBox;
  Indicator({this.orangeBox: 0, this.greyBox: 100});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        height: 15,
        decoration: BoxDecoration(
          color: myColors[GREY],
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: orangeBox,
              child: Container(
                decoration: BoxDecoration(
                  color: myColors[ORANGE],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: greyBox,
              child: Container(
                decoration: BoxDecoration(
                  color: myColors[GREY],
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
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
