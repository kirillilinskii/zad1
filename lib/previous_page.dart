import 'package:flutter/material.dart';
import 'package:zad_1/main.dart';
import 'page_blue_print.dart';

class PreviousPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageBluePrint(
      orangeBox: 50,
      greyBox: 50,
      continueTo: MyApp(),
    );
  }
}
