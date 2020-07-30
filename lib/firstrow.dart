import 'package:flutter/material.dart';
import 'constants.dart';


class Firstrow extends StatelessWidget {

  Firstrow({@required this.cardtext, @required this.cardicon, this.styling});

  final String cardtext;
  final IconData cardicon;
  final TextStyle styling;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(cardicon, size: 80,),
        SizedBox(height: 10,),
        Text(cardtext, style: kTextstyle,)
      ],
    );
  }
}