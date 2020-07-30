import 'package:bmi_calculator/cards.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'input_page.dart';

class Resultpage extends StatelessWidget {

  Resultpage({this.bmicontext, this.bmiresult, this.bmitext});

  final String bmiresult;
  final String bmitext;
  final String bmicontext;

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR',),
        centerTitle: true,
        
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text('Your Result', style: kResultstyle ),
            ),
          ),
          Expanded(
            flex: 5,
            child: boxes(
              colour: kActivecardcolor,
              cardchild: Column(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(bmitext, style: kResulttextstyle,),
                  Text(bmiresult, style: kBmitextstyle,),
                  Text(bmicontext, textAlign: TextAlign.center,),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context, '/');
            },
            child: bottombutton(
              bottomtext: Text('RECALCULATE', style: kLargebutton,),
            ),
          )
        ],
      ),

    );
  }
}
