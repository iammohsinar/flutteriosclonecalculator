import 'package:flutter/material.dart';

void main() => runApp(new IosCloneCalculator());


class IosCloneCalculator extends StatelessWidget {

  Widget build(BuildContext buildcx) {
    return new MaterialApp(
      title: '',
      home: new IosCloneCalc(),
    );
  }
}

class IosCloneCalc extends StatefulWidget {
  IosCloneCalcState createState() => IosCloneCalcState();
}

class IosCloneCalcState extends State<IosCloneCalc> {
  
  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';



  Widget btn(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
              child: Text(btnText,
              style: TextStyle(
                fontSize: 30                
              ),
              ),
              onPressed: (){
                  calculation(btnText);
              },
              color: color,
              padding: EdgeInsets.all(22.0),
              shape: CircleBorder()

    )
    );
  } // end of button

  Widget btnZero(btnText, Color color) {
    return Container(
      padding: EdgeInsets.only(bottom: 10.0),
      child: new RaisedButton(
              child: Text(btnText,
              style: TextStyle(
                fontSize: 30                
              ),
              ),
              onPressed: (){
                calculation(btnText);
              },
              color: color,
              padding: EdgeInsets.only(left:81 ,top:20,right:81,bottom: 20),
              shape: StadiumBorder()

    )
    );
  } // end of button
  
  Widget build(BuildContext buildCx) {
    return new Scaffold(
      appBar: null,
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.0,                  
                  ),
                  textAlign: TextAlign.right,
                  maxLines: 1,
                ),
              )
            ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              btn('C',const Color(0xffa5a5a5)), // AARRGGBB
              btn('+/-',const Color(0xffa5a5a5)),
              btn('%',const Color(0xffa5a5a5)),
              btn('/', Colors.orange),            
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              btn('7',const Color(0xff333333)),
              btn('8',const Color(0xff333333)),
              btn('9',const Color(0xff333333)),
              btn('x',Colors.orange),
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              btn('4',const Color(0xff333333)),
              btn('5',const Color(0xff333333)),
              btn('6',const Color(0xff333333)),
              btn('-',Colors.orange),
            ],), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              btn('1',const Color(0xff333333)),
              btn('2',const Color(0xff333333)),
              btn('3',const Color(0xff333333)),
              btn('+',Colors.orange),
            ],), 
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
              btnZero('0',const Color(0xff333333)),           
              btn('.',const Color(0xff333333)),
              btn('=',Colors.orange),
            ],),         
          ],
        ),
      ),
    );

  } // end of state class 



  void calculation(btnText) {


    if(btnText  == 'C') {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '';
      opr = '';
      preOpr = '';
    
    } else if( opr == '=' && btnText == '=') {

      if(preOpr == '+') {
         finalResult = add();
      } else if( preOpr == '-') {
          finalResult = sub();
      } else if( preOpr == 'x') {
          finalResult = mul();
      } else if( preOpr == '/') {
          finalResult = div();
      } 

    } else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {

      if(numOne == 0) {
          numOne = double.parse(result);
      } else {
          numTwo = double.parse(result);
      }

      if(opr == '+') {
          finalResult = add();
      } else if( opr == '-') {
          finalResult = sub();
      } else if( opr == 'x') {
          finalResult = mul();
      } else if( opr == '/') {
          finalResult = div();
      } 
      preOpr = opr;
      opr = btnText;
      result = '';
    }
    else if(btnText == '%') {
     result = numOne / 100;
     finalResult = doesContainDecimal(result);
    } else if(btnText == '.') {
      if(!result.toString().contains('.')) {
        result = result.toString()+'.';
      }
      finalResult = result;
    }
    
    else if(btnText == '+/-') {
        result.toString().startsWith('-') ? result = result.toString().substring(1): result = '-'+result.toString();        
        finalResult = result;        
    
    } 
    
    else {
        result = result + btnText;
        finalResult = result;        
    }


    setState(() {
          text = finalResult;
        });

  }


  String add() {
         result = (numOne + numTwo).toString();
          numOne = double.parse(result);           
          return doesContainDecimal(result);
  }

String sub() {
         result = (numOne - numTwo).toString();
          numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String mul() {
         result = (numOne * numTwo).toString();
          numOne = double.parse(result);
         return doesContainDecimal(result);
  }
  String div() {
          result = (numOne / numTwo).toString();
           numOne = double.parse(result);
          return doesContainDecimal(result);
  }


  String doesContainDecimal(dynamic result) {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }

}