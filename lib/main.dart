
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
  int First_Number = 0;
  int Second_Number = 0;
  String The_Object_Is_Displayed_On_The_Screen = "";
  String Operator = "";
  int Check_What_Number_You_Are_Entering = 0;
  String Shadow_Of_Result = "";

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

  void ClickButton(String Button) {
    if (Button == "c") {
      Result = "";
      First_Number = 0;
      Second_Number = 0;
      The_Object_Is_Displayed_On_The_Screen = "";
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
          Result = (First_Number + Second_Number).toString();
          First_Number = 0;
          Second_Number = 0;
          Operator = "";
          Check_What_Number_You_Are_Entering = 1;
        } else if (Operator == "-") {
          Result = (First_Number - Second_Number).toString();
          First_Number = 0;
          Second_Number = 0;
          Operator = "";
          Check_What_Number_You_Are_Entering = 1;
        } else if (Operator == "X") {
          Result = (First_Number * Second_Number).toString();
          First_Number = 0;
          Second_Number = 0;
          Operator = "";
          Check_What_Number_You_Are_Entering = 1;
        } else if (Operator == "/") {
          double Division = 0.0;

          Division = (First_Number / Second_Number);
          First_Number = 0;
          Second_Number = 0;
          Result = Division.toString();

          Operator = "";
          Check_What_Number_You_Are_Entering = 1;
        }
        Shadow_Of_Result = Result;
      }
    } else {
      if (Operator == "") {
        if (Check_What_Number_You_Are_Entering == 1) {
          First_Number = int.parse(Button);
          Check_What_Number_You_Are_Entering = 0;
          Result = First_Number.toString();
        } else {
          First_Number = int.parse(The_Object_Is_Displayed_On_The_Screen + Button);
          Result = First_Number.toString();
        }
      } else {
        if (The_Object_Is_Displayed_On_The_Screen == "+" ||
            The_Object_Is_Displayed_On_The_Screen == "-" ||
            The_Object_Is_Displayed_On_The_Screen == "X" ||
            The_Object_Is_Displayed_On_The_Screen == "/") {
          The_Object_Is_Displayed_On_The_Screen = "";
        }
        Second_Number = int.parse(The_Object_Is_Displayed_On_The_Screen + Button);
        Result = Second_Number.toString();
      }
    }
    setState(() {
      The_Object_Is_Displayed_On_The_Screen = Result;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.cyan,
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
                              First_Number = int.parse(Shadow_Of_Result);
                              Result = Shadow_Of_Result;
                              setState(() {
                                The_Object_Is_Displayed_On_The_Screen = Result;
                              });
                            },
                            child: Text("history reslut  " + Shadow_Of_Result),
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
                  The_Object_Is_Displayed_On_The_Screen,
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










