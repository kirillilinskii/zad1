import 'package:flutter/material.dart';
import 'package:zad_1/main.dart';
import 'date_underline.dart';
import 'indicator.dart';

class PageBluePrint extends StatelessWidget {
  final int orangeBox;
  final int greyBox;
  final bool staringunebled;
  final Widget continueTo;
  PageBluePrint(
      {this.orangeBox,
      this.greyBox,
      this.continueTo,
      this.staringunebled: false});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white),
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          backgroundColor: Colors.white,
          appBar: mainAppBar(context, MyApp()),
          body: LayoutBuilder(
            builder: (context, constraints) => Container(
              color: myColors[PRIMARY],
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Indicator(
                    orangeBox: orangeBox,
                    greyBox: greyBox,
                  ),
                  SizedBox(
                    height: constraints.maxHeight * 0.77,
                  ),
                  ContinueButton(continueTo, staringunebled),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
