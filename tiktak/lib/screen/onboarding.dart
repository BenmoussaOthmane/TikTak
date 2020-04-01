import 'package:flutter/material.dart';
import 'package:tiktak/animation/FadeAnimation.dart';
import 'package:tiktak/screen/playe.dart';

class Onboarding extends StatefulWidget {
  static final String id = 'onboarding';
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child:FadeAnimation(1,Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Tik',
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Colors.white,
                        fontFamily: 'calibri',
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Tak',
                    style: TextStyle(
                        letterSpacing: 5,
                        color: Color(0xffcff1ef),
                        fontFamily: 'calibri',
                        fontSize: 50,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )),
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FadeAnimation(3,Container(
                  height: MediaQuery.of(context).size.height / 11,
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: FlatButton(
                    onPressed:()=> Navigator.pushReplacementNamed(context,Playe.id),
                    child:Text(
                      'Playe',
                      style: TextStyle(
                        letterSpacing: 5,
                        color: Color(0xffcff1ef),
                        fontFamily: 'calibri',
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )
                    ),
                  decoration: BoxDecoration(
                    color: Colors.grey[850],
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[900],
                        offset: Offset(5.0,5.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                      BoxShadow(
                        color: Colors.grey[800],
                        offset: Offset(-5.0,-5.0),
                        blurRadius: 15.0,
                        spreadRadius: 1.0,
                      ),
                    ]
                  ),
                )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
