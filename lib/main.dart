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
          Result = (firstNumber * secondNumber).toString();import 'package:flutter/material.dart';

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

  Widget CreateButtom(String button) {
    return Expanded(

      child: Container(
        color: Colors.yellow,
        child: OutlinedButton(

          onPressed: () {
            ClickButton(button);
          },
          child: Text(
            button,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),

    );
  }

  void ClickButton(String button) {
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








