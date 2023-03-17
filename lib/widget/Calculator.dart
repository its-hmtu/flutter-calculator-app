import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'Button.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _Calculator();
}

class _Calculator extends State<Calculator> {
  
  var userQuestion = '';
  var userAnswer = '';
  final List<String> buttons = 
  [
    '( ',
    ' )',
    'AC',
    'C',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '*',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '=',
    '+',
  ]; 
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea
    (
      child: Scaffold
      (
        backgroundColor: Color.fromARGB(255, 28, 28, 28),
        body: Column
        (
          children: 
          [
            Expanded 
            (
              child: Column
              (
                children: 
                [
                  SizedBox(height: 20.0,),
                  Container
                  (
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text
                    (
                      userQuestion,
                      textAlign: TextAlign.left,
                      style: TextStyle
                      (
                        fontSize: 30.0,
                        color: Colors.white70,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ),

                  Container
                  (
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.all(20),
                    child: Text
                    (
                      userAnswer,
                      textAlign: TextAlign.right,
                      style: TextStyle
                      (
                        fontSize: 40.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      )
                    )
                  )
                ],
              ),
            ),

            Expanded
            (
              flex: 2,
              child: GridView.builder
              (
                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4), 
                itemBuilder: (BuildContext context, int index) 
                {
                  if (index == 2) 
                  {
                    return MyButton
                    (
                      btnText: buttons[index],
                      btnPressed: () {
                        setState(() {
                          userQuestion = '';
                          userAnswer = '';
                        });
                      },
                      btnColor: Color.fromARGB(255, 212, 212, 210)
                    );
                  }

                  else if (index == buttons.length - 2) 
                  {
                    return MyButton
                    (
                      btnText: buttons[index],
                      btnPressed: () {
                        setState(() {
                          equalPressed();
                        });
                      },

                      btnColor: Color.fromARGB(255,255, 149, 0)
                    );
                  }

                  else if (index == 3) 
                  {
                    return MyButton
                    (
                      btnText: buttons[index],
                      btnPressed: () {
                        setState(() {
                          userQuestion = userQuestion.substring(0, userQuestion.length - 1);
                        });
                      },

                      btnColor: Color.fromARGB(255, 212, 212, 210),
                    );
                  }

                  else if (index == 0 || index == 1)
                  {
                    return MyButton
                    (
                      btnText: buttons[index], 
                      btnPressed: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      }, 
                      btnColor: Color.fromARGB(255, 212, 212, 210),
                    );
                  }

                  else 
                  {
                    return MyButton
                    (
                      btnText: buttons[index],
                      btnPressed: () {
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      }, 
                      btnColor: isOperator(buttons[index])
                        ? Color.fromARGB(255,255, 149, 0)
                        : Color.fromARGB(255, 128, 128, 128),
                    );
                  }
                }
              ),
            ),
          ],
        ),
      ),
    );
  }


  bool isOperator(String str) {
    if (str == '+' || str == '-' || str == '*' || str == '/')
    {
      return true;
    }
    else {
      return false;
    }
  }


  void equalPressed() {
    String finalQuestion = userQuestion;
    try 
    {
      Parser p = Parser();
      Expression exp = p.parse(finalQuestion);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);
      userAnswer = eval.toString();
    }
    catch(e) 
    {
      print(e);
    } 
  }
}

