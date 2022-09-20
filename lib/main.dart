

import 'dart:ffi';

import 'package:flutter/material.dart';
void main(){
  runApp(
   caculator()
  );
}
class caculator extends StatefulWidget{

  @override
  State<caculator> createState() => _caculatorState();
}

class _caculatorState extends State<caculator> {
  String  resluts="";
  int firstnumber=0;
  int secondnumber=0;
  String text="";
  String operator="";
  int test=0;
  String shadow="";
  String checknullfirstnumber="";
  String checknullsecondnumber="";
  Widget createbuttom (String number)
  {
    return  Expanded(

      child: OutlinedButton(

        onPressed: () {
          clickbtn(number);
        },

        child: Text(
          number,
          style: TextStyle(
              fontSize: 20
          ),
        ),

      ),
    );
  }
  clickbtn(btn)
  {
    if(btn=="c")
      {
        resluts="";
        firstnumber=0;
        secondnumber=0;
        text="";
        operator="";
      }
else if(btn=="+"||btn=="-"||btn=="X"||btn=="/")
  {
    operator=btn;
   resluts=btn;

  }
else if(btn=="="){

    {
      
 if(operator=="+")
   {
     resluts=(firstnumber+secondnumber).toString();
     firstnumber=0;
     secondnumber=0;
     operator="";
     test=1;
   }
 else if(operator=="-")
 {
   resluts=(firstnumber-secondnumber).toString();
   firstnumber=0;
   secondnumber=0;
   operator="";
   test=1;

 }
 else if(operator=="X")
 {
   resluts=(firstnumber*secondnumber).toString();
   firstnumber=0;
   secondnumber=0;
   operator="";
   test=1;
 }
 else if(operator=="/")
 {
   double chia=0.0;

   chia=(firstnumber/secondnumber);
   firstnumber=0;
   secondnumber=0;
   resluts=chia.toString();

   operator="";
   test=1;
 }
shadow=resluts;
    }
  }
else{
  if(operator=="") {
    if(test==1)
      {

        firstnumber = int.parse( btn);
        test=0;
        resluts=firstnumber.toString();
      }
    else
      {
        firstnumber = int.parse(text + btn);
        resluts=firstnumber.toString();

      }
  
    }


  else
    {
      if(text=="+"||text=="-"||text=="X"||text=="/")
        {
          text="";
        }
    secondnumber=int.parse(text + btn);
    resluts=secondnumber.toString();

    }
 
    }
setState(() {
  text=resluts;
});
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
  return    MaterialApp(
    home: Scaffold
      (
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
                  alignment:  Alignment.topLeft,
                  child:OutlinedButton(
                    onPressed: (){
                      firstnumber=int.parse(shadow);
                      resluts=shadow;
                      setState(() {
                        text=resluts;
                      });
                    },
                    child: Text("history reslut  "+shadow),

                  )
              ),
            )
          ],
        ),
      ),
      Expanded(
          child: Container(
            color: Colors.cyan,
            alignment: Alignment.bottomRight,
            child: Text(text,
              style: TextStyle(
                color: Colors.red,
                fontSize: 60
              ),
            ),
          )
      ),

      Row(
        children: [
          createbuttom("c"),
          createbuttom("="),
          createbuttom("0"),
          createbuttom("/")


        ],
      ),
      Row(
        children: [
       createbuttom("9"),
          createbuttom("8"),
          createbuttom("7"),
          createbuttom("X")


        ],
      ),
      Row(
        children: [
          createbuttom("6"),
          createbuttom("5"),
          createbuttom("4"),
          createbuttom("-")


        ],
      ),
      Row(
        children: [
          createbuttom("3"),
          createbuttom("2"),
          createbuttom("1"),
          createbuttom("+")


        ],
      )

    ],
  ),
),
      ),

    );

  }
}







