import 'package:flutter/material.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:zad_1/page_blue_print.dart';
import 'package:zad_1/previous_page.dart';
import 'date_underline.dart';
import 'indicator.dart';

void main() {
  runApp(MyApp());
}

bool unenabled = true;
AppBar mainAppBar(BuildContext context, Widget prevPage) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    leading: InkWell(
      onTap: () {
        Navigator.push(context, CustomPageRoute(builder: (context) {
          return prevPage;
        }));
      },
      child: Icon(
        Icons.keyboard_backspace,
        color: myColors[ICONCOLOR],
        size: 30,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.white, primarySwatch: Colors.orange),
      color: myColors[ORANGE],
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (context) => Scaffold(
          appBar: mainAppBar(context, PreviousPage()),
          body: Container(
            color: Colors.white,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    Indicator(
                      orangeBox: 60,
                      greyBox: 40,
                    ),
                    _DateBirth(
                      context,
                      constraints,
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _DateBirth extends StatelessWidget {
  final BuildContext context;
  final BoxConstraints constraints;
  _DateBirth(this.context, this.constraints);
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: constraints.maxHeight * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 45),
            child: Text(
              'Your birthday is:',
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 42,
                //fontWeight: FontWeight.bold,
                color: myColors[BIRTHDAYTEXTCOLOR],
              ),
            ),
          ),
          SizedBox(
            height: constraints.maxHeight * 0.23,
          ),
          BirthdayDate(context, constraints),
        ],
      ),
    );
  }
}

class BirthdayDate extends StatefulWidget {
  BuildContext context;
  BoxConstraints constraints;
  BirthdayDate(this.context, this.constraints);
  @override
  _BirthdayDateState createState() => _BirthdayDateState(context, constraints);
}

class _BirthdayDateState extends State<BirthdayDate> {
  BuildContext context;
  BoxConstraints constraints;
  _BirthdayDateState(this.context, this.constraints);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SetDatePicker(() {
              setState(() {
                unenabled = false;
              });
            }),
            DateUnderline(),
          ],
        ),
        SetDatePicker(
          () {
            setState(() {
              unenabled = false;
            });
          },
        ),
        SizedBox(
          height: constraints.maxHeight * 0.2,
        ),
        ContinueButton(
            PageBluePrint(
              orangeBox: 70,
              greyBox: 30,
              staringunebled: unenabled,
            ),
            unenabled),
      ],
    );
  }
}

class ContinueButton extends StatelessWidget {
  final Widget newPage;
  final bool unenabledValue;
  ContinueButton(this.newPage, this.unenabledValue);
  @override
  Widget build(BuildContext context) {
    // bool _enabled = dateBirth == ['', '', '', '', '', '', '', ''];
    return GestureDetector(
      onTap: () {
        (unenabledValue)
            ? null
            : Navigator.push(
                context,
                CustomPageRoute(builder: (context) => newPage),
              );
      },
      child: Container(
        height: 50,
        width: 300,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              wordSpacing: 100,
            ),
          ),
        ),
      ),
    );
  }
}

class SetDatePicker extends StatefulWidget {
  Function changes;
  SetDatePicker(this.changes);
  @override
  _SetDatePickerState createState() => _SetDatePickerState(changes);
}

class _SetDatePickerState extends State<SetDatePicker> {
  Function changes;
  _SetDatePickerState(this.changes);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: Colors.white,
      child: DateTimePicker(
          style: TextStyle(fontSize: 0),
          autofocus: true,
          use24HourFormat: false,
          cursorWidth: 0,
          initialValue: '',
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          dateLabelText: '',
          onChanged: (val) {
            print(val);
            setState(() {
              dateBirth[0] = val[8];
              dateBirth[1] = val[9];
              dateBirth[2] = val[5];
              dateBirth[3] = val[6];
              dateBirth[4] = val[0];
              dateBirth[5] = val[1];
              dateBirth[6] = val[2];
              dateBirth[7] = val[3];
              changes();
            });
          },
          validator: (val) {
            return null;
          },
          onSaved: (val) {}),
    );
  }
}

class CustomPageRoute extends MaterialPageRoute {
  CustomPageRoute({builder}) : super(builder: builder);

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);
}
