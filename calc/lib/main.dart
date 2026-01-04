import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}
class MyApp extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
  return MyAppstate();

}
}
class MyAppstate extends State<MyApp>{
  double size = 0.0;
  String inpValue ="";
  String calculatedval = "";
  String operator = "";
@override
  Widget build(BuildContext context) {
   size = MediaQuery.of(context).size.width/5;

   return MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [

          Container(
            alignment: Alignment.bottomRight,
            child:Text(inpValue,style: TextStyle(color: Colors.white,fontSize: 50),),
          ),
          Row(
            children: [
              
             calcbtn("7", Colors.white54),
             calcbtn("8", Colors.white54),
             calcbtn("9", Colors.white54),
             calcbtn("/", Colors.orange),

       
            ],
          ),
             Row(
            children: [
              
             calcbtn("4", Colors.white54),
             calcbtn("5", Colors.white54),
             calcbtn("6", Colors.white54),
             calcbtn("*", Colors.orange),

       
            ],
          ),
             Row(
            children: [
              
             calcbtn("2", Colors.white54),
             calcbtn("3", Colors.white54),
             calcbtn("1", Colors.white54),
             calcbtn("-", Colors.orange),

       
            ],
          ),
             Row(
            children: [
              
             calcbtn("0", Colors.white54),
             calcbtn(".", Colors.white54),
             calcbtn("=", Colors.orange),
             calcbtn("+", Colors.orange),

       
            ],
          ),
          calcbtn("CLEAR", Colors.black)
        ],
      ),
    ),
   );

  }
  Widget calcbtn( String text, Color bgcolor)
  {
    return    InkWell(
      
      onTap: ()  {
       if(text=="CLEAR")
       {
        setState(() {
          inpValue="";
        });
       }
       else if(text == "/" || text == "*" || text== "-" || text=="+")
       {setState(() {
          calculatedval=inpValue;
        inpValue="";
        operator  = text;
       });
       
       }
       else if(text == "=")
       {
        setState(() {
           double calc = double.parse(calculatedval);
        double inp = double.parse(inpValue);
        if(operator=="+"){
               inpValue = (calc+inp).toString();
        }
        else if(operator=="-"){
           inpValue = (calc-inp).toString();
        }
         else if(operator=="*"){
           inpValue = (calc*inp).toString();
        }
         else if(operator=="/"){
           inpValue = (calc/inp).toString();
        }
        });
       }
       else{
           setState(() {
         inpValue=inpValue+text;
       });
       }
      
      },
      child: Container(
                  decoration: BoxDecoration(
                    color:bgcolor ,
                    borderRadius: BorderRadius.circular(100),
                    ),
                    margin: EdgeInsets.all(10),
                    height: size,
                    width: size,
                    alignment: Alignment.center,
                  child:Text(text,style:TextStyle(color: Colors.white,fontSize:30),)),
    );
  }
}
