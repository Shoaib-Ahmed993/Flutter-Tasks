import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';


class Calculator extends StatefulWidget {

  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var result = "";

  Widget myButton (var text){
    return Expanded(
        child: MaterialButton(
          padding: EdgeInsets.all(25),
          onPressed: (){
            setState(() {
              result = result + " " + text;    
            });
          }, 
          child: Text(text, style: TextStyle(fontSize: 25, color: Colors.black54),)
        ),
    );
  }

  clear(){
  setState(() {
      result = "";
    });
}

output(){
  Parser parser = Parser();
  Expression expression = parser.parse(result);
  ContextModel contextModel = ContextModel();
  double eval = expression.evaluate(EvaluationType.REAL, contextModel);

  setState(() {
      result = eval.toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8cc0e6),
      appBar: AppBar(
        title: Center(
          child: Text('Simple Calculator',style: TextStyle(color: Colors.black87),)
        ),
      backgroundColor: Colors.lightBlueAccent,
    ),

      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: Text(result, style: TextStyle(
                  fontSize: 30, fontWeight: FontWeight.w600
                  ),
                ),
              ),
            ),

            Row(
              children: [
                myButton("9"),
                myButton("8"),
                myButton("7"),
                myButton("+"),
              ],
            ),
            Row(
              children: [
                myButton("6"),
                myButton("5"),
                myButton("4"),
                myButton("-"),
              ],
            ),
            Row(
              children: [
                myButton("3"),
                myButton("2"),
                myButton("1"),
                myButton("*"),
              ],
            ),
            Row(
              children: [
                MaterialButton(
                  onPressed: clear,
                  child: Text('C', style: TextStyle(fontSize: 25, color: Colors.black54),),
                ),
                myButton("0"),
                MaterialButton(
                  onPressed: output,
                  child: Text('=',style: TextStyle(fontSize: 25, color: Colors.black54),),
                ),
                myButton("/"),
              ],
            ),
          ],
        ),
      ),


    );
  }
}