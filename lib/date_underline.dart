import 'package:flutter/material.dart';

const ORANGE = 'orange';
const GREY = 'grey';
const PRIMARY = 'white';
const BIRTHDAYTEXTCOLOR = 'birthdaytextcolor';
const DARKGREY = 'darkgrey';
const ICONCOLOR = 'iconcolor';

const Map<String, Color> myColors = {
  'orange': Color.fromRGBO(246, 173, 77, 1),
  'grey': Color.fromRGBO(240, 241, 246, 1),
  'primary': Colors.white,
  'birthdaytextcolor': Color.fromRGBO(68, 68, 68, 1),
  'darkgrey': Color.fromRGBO(189, 198, 204, 1),
  'iconcolor': Color.fromRGBO(187, 199, 217, 1),
};
List<String> dateBirth = ['', '', '', '', '', '', '', ''];

class DateUnderline extends StatefulWidget {
  //List<String> data;
  //DateUnderline(this.data);

  @override
  _DateUnderlineState createState() => _DateUnderlineState();
}

class _DateUnderlineState extends State<DateUnderline> {
  //List<String> date;
  // _DateUnderlineState(this.date);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Number(dateBirth[0]),
          Number(dateBirth[1]),
          Dot(),
          Number(dateBirth[2]),
          Number(dateBirth[3]),
          Dot(),
          Number(dateBirth[4]),
          Number(dateBirth[5]),
          Number(dateBirth[6]),
          Number(dateBirth[7]),
        ],
      ),
    );
  }
}

class Number extends StatelessWidget {
  final String numb;
  Number([@required this.numb = '']);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 2, right: 2),
      child: Container(
        child: Column(
          children: [
            Container(
              height: 60,
              width: 35,
              child: Text(
                numb,
                style: TextStyle(
                  fontSize: 60,
                  color: myColors[DARKGREY],
                ),
              ),
            ),
            Container(
              height: 3,
              width: 35,
              decoration: BoxDecoration(
                  color: myColors[DARKGREY],
                  borderRadius: BorderRadius.all(Radius.circular(15))),
            ),
          ],
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 15,
          ),
          Container(
            child: CircleAvatar(
              backgroundColor: myColors[DARKGREY],
              radius: 4,
            ),
          )
        ],
      ),
    );
  }
}
