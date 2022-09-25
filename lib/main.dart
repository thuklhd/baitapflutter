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
  int firstNumber = 0;
  int secondNumber = 0;
  String operator = "";
  bool checkNumber = true;
  String previousResult = "";

  Widget CreateButtom(String Button) {
    return Expanded(

      child: Container(
        color: Colors.yellow,
        child: OutlinedButton(

          onPressed: () {
            ClickButton(Button);
          },
          child: Text(
            Button,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),

    );
  }

  void ClickButton(String Button) {
    if (Button == "c") {
      Result = "";
      firstNumber = 0;
      secondNumber = 0;
      Result = "";
      operator = "";
    } else if (Button == "+" ||
        Button == "-" ||
        Button == "X" ||
        Button == "/") {
      operator = Button;
      Result = Button;
    } else if (Button == "=") {
      {
        if (operator == "+") {
          Result = (firstNumber + secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "-") {
          Result = (firstNumber - secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "X") {
          Result = (firstNumber * secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "/") {
          double Division = 0.0;

          Division = (firstNumber / secondNumber);
          firstNumber = 0;
          secondNumber = 0;
          Result = Division.toString();

          operator = "";
          checkNumber = true;
        }
        previousResult = Result;
      }
    } else {
      if (operator == "") {
        if (checkNumber ) {
          firstNumber = int.parse(Button);
          checkNumber = false;
          Result = firstNumber.toString();
        } else {
          firstNumber = int.parse(Result + Button);
          Result = firstNumber.toString();
        }
      } else {
        if (Result == "+" ||
            Result == "-" ||
            Result == "X" ||
            Result == "/") {
          Result = "";
        }
        secondNumber = int.parse(Result + Button);
        Result = secondNumber.toString();
      }
    }
    setState(() {
      Result;
    });
  }

  @override
  Widget build(BuildContext  context) {
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
                              firstNumber = int.parse(previousResult);
                              Result = previousResult;
                              setState(() {
                                 Result;
                              });
                            },
                            child: Text("history reslut  " + previousResult),
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
                  Result,
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











