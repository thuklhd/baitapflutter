import 'package:flutter/material.dart';

void main() {
  runApp(Caculator());
}

class Caculator extends StatefulWidget {
  @override
  State<Caculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Caculator> {
  String result = "";
  int firstNumber = 0;
  int secondNumber = 0;
  String operator = "";
  bool checkNumber = true;
  String previousResult = "";

  Widget createButtom(String button) {
    return Expanded(

      child: Container(
        color: Colors.yellow,
        child: OutlinedButton(

          onPressed: () {
            clickButton(button);
          },
          child: Text(
            button,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),

    );
  }

  void clickButton(String button) {
    if (button == "c") {
      result = "";
      firstNumber = 0;
      secondNumber = 0;
      result = "";
      operator = "";
    } else if (button == "+" ||
        button == "-" ||
        button == "X" ||
        button == "/") {
      operator = button;
      result = button;
    } else if (button == "=") {
      {
        if (operator == "+") {
          result = (firstNumber + secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "-") {
          result = (firstNumber - secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "X") {
          result = (firstNumber * secondNumber).toString();
          firstNumber = 0;
          secondNumber = 0;
          operator = "";
          checkNumber = true;
        } else if (operator == "/") {
          double division = 0.0;

          division = (firstNumber / secondNumber);
          firstNumber = 0;
          secondNumber = 0;
          result = division.toString();

          operator = "";
          checkNumber = true;
        }
        previousResult = result;
      }
    } else {
      if (operator == "") {
        if (checkNumber ) {
          firstNumber = int.parse(button);
          checkNumber = false;
          result = firstNumber.toString();
        } else {
          firstNumber = int.parse(result + button);
          result = firstNumber.toString();
        }
      } else {
        if (result == "+" ||
            result == "-" ||
            result == "X" ||
            result == "/") {
          result = "";
        }
        secondNumber = int.parse(result + button);
        result = secondNumber.toString();
      }
    }
    setState(() {
      result;
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
                              firstNumber = int.parse(previousResult);
                              result = previousResult;
                              setState(() {
                                result;
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
                  result,
                  style: TextStyle(color: Colors.red, fontSize: 60),
                ),
              )),
              Row(
                children: [
                  createButtom("c"),
                  createButtom("="),
                  createButtom("0"),
                  createButtom("/")
                ],
              ),
              Row(
                children: [
                  createButtom("9"),
                  createButtom("8"),
                  createButtom("7"),
                  createButtom("X")
                ],
              ),
              Row(
                children: [
                  createButtom("6"),
                  createButtom("5"),
                  createButtom("4"),
                  createButtom("-")
                ],
              ),
              Row(
                children: [
                  createButtom("3"),
                  createButtom("2"),
                  createButtom("1"),
                  createButtom("+")
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


