// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  btnPressed(String btnText) {
    setState(() {
      if (btnText == "C") {
        equation = "0";
        result = "0";
      } else if (btnText == "⨶") {
        equation = equation.substring(0, equation.length - 1);
      } else if (btnText == "=") {
        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');
       try{
        Parser p = Parser();
        Expression exp = p.parse(expression);

        ContextModel cm = ContextModel();
        result = "${exp.evaluate(EvaluationType.REAL, cm)}";
       }catch(e){
         print(e);
       }
      } else {
        if (equation == "0") {
          equation = btnText;
        } else {
          equation = equation + btnText;

        }
      }
    });
  }

  Widget createButton(String btnText, double btnHeight, Color btnColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * btnHeight,
      child: RawMaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
          side: const BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
        ),
        fillColor: btnColor,
        // padding: EdgeInsets.all(16.0),
        child: Text(
          btnText,
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
        onPressed: () => btnPressed(btnText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    var responsiveSize= MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
        centerTitle: true,
      ),
      body: Builder(
        builder: (context) {
          if(responsiveSize.orientation == Orientation.portrait){
            return potraitWidget(responsiveSize.size);
          }else
            {
              return landscapWidget(responsiveSize.size);
            }
        },
      ),
    );
  }

  Widget potraitWidget(Size size) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          alignment: Alignment.centerRight,
          child: Text(
            equation,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
        Expanded(child: Divider(
        )),
        Expanded(child:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.75,
                child: Table(
                  children: [
                    TableRow(children: [
                      createButton("C", 1, Colors.green),
                      createButton("⨶", 1, Colors.blue),
                      createButton("÷", 1, Colors.blue),
                    ]),
                    TableRow(children: [
                      createButton("7", 1, Colors.black54),
                      createButton("8", 1, Colors.black54),
                      createButton("9", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton("4", 1, Colors.black54),
                      createButton("5", 1, Colors.black54),
                      createButton("6", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton("1", 1, Colors.black54),
                      createButton("2", 1, Colors.black54),
                      createButton("3", 1, Colors.black54),
                    ]),
                    TableRow(children: [
                      createButton(".", 1, Colors.black54),
                      createButton("0", 1, Colors.black54),
                      createButton("00", 1, Colors.black54),
                    ]),
                  ],
                ),
              ),
              Container(
                width:size.width * 0.25,
                child: Table(
                  children: [
                    TableRow(
                      children: [createButton("×", 1, Colors.blue)],
                    ),
                    TableRow(
                      children: [createButton("-", 1, Colors.blue)],
                    ),
                    TableRow(
                      children: [createButton("+", 1, Colors.blue)],
                    ),
                    TableRow(
                      children: [createButton("=", 2, Colors.redAccent)],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),)

      ],
    );
  }

  Widget landscapWidget(Size size) {
    return  Column(
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          alignment: Alignment.centerRight,
          child: Text(
            equation,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          alignment: Alignment.centerRight,
          child: Text(
            result,
            style: TextStyle(
              fontSize: 30,
            ),
          ),
        ),
        Expanded(child: Divider()),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.75,
                  child: Table(
                    children: [
                      TableRow(children: [
                        createButton("C", 1, Colors.green),
                        createButton("⨶", 1, Colors.blue),
                        createButton("÷", 1, Colors.blue),
                      ]),
                      TableRow(children: [
                        createButton("7", 1, Colors.black54),
                        createButton("8", 1, Colors.black54),
                        createButton("9", 1, Colors.black54),
                      ]),
                      TableRow(children: [
                        createButton("4", 1, Colors.black54),
                        createButton("5", 1, Colors.black54),
                        createButton("6", 1, Colors.black54),
                      ]),
                      TableRow(children: [
                        createButton("1", 1, Colors.black54),
                        createButton("2", 1, Colors.black54),
                        createButton("3", 1, Colors.black54),
                      ]),
                      TableRow(children: [
                        createButton(".", 1, Colors.black54),
                        createButton("0", 1, Colors.black54),
                        createButton("00", 1, Colors.black54),
                      ]),
                    ],
                  ),
                ),
                Container(
                  width:size.width * 0.25,
                  child: Table(
                    children: [
                      TableRow(
                        children: [createButton("×", 1, Colors.blue)],
                      ),
                      TableRow(
                        children: [createButton("-", 1, Colors.blue)],
                      ),
                      TableRow(
                        children: [createButton("+", 1, Colors.blue)],
                      ),
                      TableRow(
                        children: [createButton("=", 2, Colors.redAccent)],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
