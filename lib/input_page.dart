import 'package:bmi_calculator/results.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'firstrow.dart';
import 'cards.dart';
import 'calculatorbrain.dart';


enum Gender{
  Male,
  Female
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int height = 180;
  int weight = 60;
  int age = 18;
  Gender selectedgender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: boxes(
                  onpress: (){
                    setState(() {
                      selectedgender = Gender.Male;
                    });
                  },
                  colour: selectedgender == Gender.Male? kActivecardcolor : kInactivecardcolor,
                  cardchild: Firstrow(
                    cardtext: 'MALE',
                    cardicon: FontAwesomeIcons.mars,
                  ) ,
                ),
              ),
              Expanded(
                child: boxes(
                  onpress: (){
                    setState(() {
                      selectedgender = Gender.Female;
                    });
                  },
                  colour: selectedgender == Gender.Female? kActivecardcolor : kInactivecardcolor,
                  cardchild: Firstrow(
                  cardtext: 'FEMALE',
                  cardicon: FontAwesomeIcons.venus,
                ),
                )
              ),
            ],
          )),
          Expanded(child:
            boxes(
              colour: kActivecardcolor,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: kTextstyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        '$height',
                        style: kFontstyle,
                      ),
                      Text(
                        'cm',
                        style: kTextstyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.teal,
                      thumbColor: Colors.tealAccent,
                      overlayColor: Colors.teal[900],
                      inactiveTrackColor: Colors.grey,
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30)
                    ),
                    child: Slider(
                      value: height.toDouble() ,
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newvalue){
                        setState(() {
                          height = newvalue.round();
                        });

                      },
                    ),
                  )
                ],
              ),
            )

          ),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(
                child: boxes(colour: kActivecardcolor,
                  cardchild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'WEIGHT',
                        style: kTextstyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kFontstyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          buttons(
                            icon: FontAwesomeIcons.minus,
                            onPressed: (){
                              setState(() {
                                weight--;
                              });

                            },
                          ),
                          SizedBox(width: 10,),
                          buttons(
                            icon: FontAwesomeIcons.plus,
                            onPressed: (){
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                )
              ),
              Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: boxes(
                        colour: kActivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('AGE', style: kTextstyle,),
                          Text(age.toString(), style: kFontstyle,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              buttons(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });

                                },

                              ),
                              SizedBox(width: 10,),
                              buttons(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age ++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                      ),
                    ),
                  ],
                )
              ),


            ],
          )),
          GestureDetector(
            onTap: (){
                CalculatorBrain calc = CalculatorBrain(
                    weight: weight,
                    height: height
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => Resultpage(
                  bmicontext: calc.getInterpretation(),
                  bmiresult: calc.calculateBMI(),
                  bmitext: calc.getResult(),
                )));

            },
            child: bottombutton(
              bottomtext: Text('RESULTS', style: kLargebutton,),
            ),
          )
          
        ],
      ),

    );
  }
}

class bottombutton extends StatelessWidget {
  
  
  bottombutton({this.bottomtext});
  Text bottomtext;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      child: Center(child: bottomtext),
      margin: EdgeInsets.only(top: 10),
      color: kBottomcontainercolor,
      width: double.infinity,
      height: kBottomcontainerheight ,

    );
  }
}

class buttons extends StatelessWidget {

  buttons({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      child: Icon(icon),
      elevation: 6,
        constraints: BoxConstraints.tightFor(
          width: 56,
          height: 56,

        ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}




