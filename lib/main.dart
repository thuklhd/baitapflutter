
import 'package:flutter/material.dart';

void main() {
  runApp(Caculator());
}

class Caculator extends StatefulWidget {
  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  String Result = "";
  int FirstNumber = 0;
  int SecondNumber = 0;
  String TheObjectIsDisplayedOnTheScreen = "";
  String Operator = "";
  int CheckWhatNumberYouAreEntering = 0;
  String ShadowOfResult = "";

  Widget CreateButtom(String Button) {
    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          ClickButton(Button);
        },
        child: Text(
          Button,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  ClickButton(Button) {
    if (Button == "c") {
      Result = "";
      FirstNumber = 0;
      SecondNumber = 0;
      TheObjectIsDisplayedOnTheScreen = "";
      Operator = "";
    } else if (Button == "+" ||
        Button == "-" ||
        Button == "X" ||
        Button == "/") {
      Operator = Button;
      Result = Button;
    } else if (Button == "=") {
      {
        if (Operator == "+") {
          Result = (FirstNumber + SecondNumber).toString();
          FirstNumber = 0;
          SecondNumber = 0;
          Operator = "";
          CheckWhatNumberYouAreEntering = 1;
        } else if (Operator == "-") {
          Result = (FirstNumber - SecondNumber).toString();
          FirstNumber = 0;
          SecondNumber = 0;
          Operator = "";
          CheckWhatNumberYouAreEntering = 1;
        } else if (Operator == "X") {
          Result = (FirstNumber * SecondNumber).toString();
          FirstNumber = 0;
          SecondNumber = 0;
          Operator = "";
          CheckWhatNumberYouAreEntering = 1;
        } else if (Operator == "/") {
          double Division = 0.0;

          Division = (FirstNumber / SecondNumber);
          FirstNumber = 0;
          SecondNumber = 0;
          Result = Division.toString();

          Operator = "";
          CheckWhatNumberYouAreEntering = 1;
        }
        ShadowOfResult = Result;
      }
    } else {
      if (Operator == "") {
        if (CheckWhatNumberYouAreEntering == 1) {
          FirstNumber = int.parse(Button);
          CheckWhatNumberYouAreEntering = 0;
          Result = FirstNumber.toString();
        } else {
          FirstNumber = int.parse(TheObjectIsDisplayedOnTheScreen + Button);
          Result = FirstNumber.toString();
        }
      } else {
        if (TheObjectIsDisplayedOnTheScreen == "+" ||
            TheObjectIsDisplayedOnTheScreen == "-" ||
            TheObjectIsDisplayedOnTheScreen == "X" ||
            TheObjectIsDisplayedOnTheScreen == "/") {
          TheObjectIsDisplayedOnTheScreen = "";
        }
        SecondNumber = int.parse(TheObjectIsDisplayedOnTheScreen + Button);
        Result = SecondNumber.toString();
      }
    }
    setState(() {
      TheObjectIsDisplayedOnTheScreen = Result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("may tinh bo tui"),
        ),
        body: Container(
          child: Column(
            children: [
              Container(
                color: Colors.cyan,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                          color: Colors.cyan,
                          alignment: Alignment.topLeft,
                          child: OutlinedButton(
                            onPressed: () {
                              FirstNumber = int.parse(ShadowOfResult);
                              Result = ShadowOfResult;
                              setState(() {
                                TheObjectIsDisplayedOnTheScreen = Result;
                              });
                            },
                            child: Text("history reslut  " + ShadowOfResult),
                          )),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                color: Colors.cyan,
                alignment: Alignment.bottomRight,
                child: Text(
                  TheObjectIsDisplayedOnTheScreen,
                  style: TextStyle(color: Colors.red, fontSize: 60),
                ),
              )),
              Row(
                children: [
                  CreateButtom("c"),
                  CreateButtom("="),
                  CreateButtom("0"),
                  CreateButtom("/")
                ],
              ),
              Row(
                children: [
                  CreateButtom("9"),
                  CreateButtom("8"),
                  CreateButtom("7"),
                  CreateButtom("X")
                ],
              ),
              Row(
                children: [
                  CreateButtom("6"),
                  CreateButtom("5"),
                  CreateButtom("4"),
                  CreateButtom("-")
                ],
              ),
              Row(
                children: [
                  CreateButtom("3"),
                  CreateButtom("2"),
                  CreateButtom("1"),
                  CreateButtom("+")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}











