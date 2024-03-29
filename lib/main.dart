import 'package:flutter/material.dart';

void main()
{
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget
{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget
{
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator>
{
  Widget calcbutton(String btntxt, Color btncolor, Color textcolor, )
  {
    return Container
    (
      child: TextButton
      (
        onPressed: ()
        {
          calculation(btntxt);
        },

        child: Text(btntxt,
        style: TextStyle
        (
          fontSize: 25,
          color: textcolor,
        ),
        ),
      ),
      color: btncolor,
      padding: EdgeInsets.all(10),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      backgroundColor: Colors.black,
      appBar: AppBar
      (
        title: Text('Calculator'),
        backgroundColor: Colors.black,
      ),

      body: Padding
      (
        padding: EdgeInsets.symmetric(horizontal: 5),
        
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.end,
          children:
          [
            //UI of calculator
            Row
            (
              mainAxisAlignment: MainAxisAlignment.end,
              children:
              [
                Padding
                (
                  padding: EdgeInsets.all(10.0),
                  child: Text
                  (text,
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),

            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                //
                calcbutton('AC', Colors.grey, Colors.black),
                calcbutton('+/-', Colors.grey, Colors.black),
                calcbutton('%', Colors.grey, Colors.black),
                calcbutton('/', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 3,),

            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                //
                calcbutton('7', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('8', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('9', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('×', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 3,),

            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                //
                calcbutton('4', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('5', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('6', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('-', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 3,),

            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                //
                calcbutton('1', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('2', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('3', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('+', Colors.orange, Colors.white),
              ],
            ),
            SizedBox(height: 3,),

            Row
            (
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children:
              [
                calcbutton('', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('0', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('.', Color.fromARGB(255, 83, 83, 83), Colors.white),
                calcbutton('=', Colors.orange, Colors.white),
              ],
            ),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children:
              [
                Text('©chamudithaperera',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                  ),
                  //textAlign: TextAlign.center,
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }


  dynamic text ='0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '';
  dynamic opr = '';
  dynamic preOpr = '';
   void calculation(btnText)
   {
    if(btnText  == 'AC')
    {
      text ='0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    }
    else if( opr == '=' && btnText == '=')
    {
      if(preOpr == '+')
      {
         finalResult = add();
      } else if( preOpr == '-')
      {
          finalResult = sub();
      } else if( preOpr == 'x')
      {
          finalResult = mul();
      } else if( preOpr == '/')
      {
          finalResult = div();
      }

    }
    else if(btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=')
    {

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


  String doesContainDecimal(dynamic result)
  {
    
    if(result.toString().contains('.')) {
        List<String> splitDecimal = result.toString().split('.');
        if(!(int.parse(splitDecimal[1]) > 0))
         return result = splitDecimal[0].toString();
    }
    return result; 
  }

}
