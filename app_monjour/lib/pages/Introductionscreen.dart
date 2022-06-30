import 'package:app_monjour/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:app_monjour/pages/welcomepage.dart';

class IntroductionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 0, 150, 136),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/Logo_animato.gif", alignment: Alignment.center),
             SizedBox(
              height: 0,
            ), 
            Container(
              alignment: AlignmentDirectional.bottomStart,
              child: Text ("How active have you been today?",
              textAlign: TextAlign.center,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white),
              ),
            ),
            Text(
              "Track your fitness activities with us!",
              textAlign: TextAlign.right,
              style: TextStyle(color: Colors.white70, height: 1.5),
            ),
          ],
          ),
           ),
          floatingActionButton:FloatingActionButton(
            
            backgroundColor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => WelcomePage()));
                  },
                  elevation: 2.0,
                  child: Icon(
                    Icons.arrow_forward_ios_sharp,
                    color: Color.fromARGB(249, 0, 150, 136),
                  ),
                  shape: CircleBorder(),
                ),
                );

  }
}