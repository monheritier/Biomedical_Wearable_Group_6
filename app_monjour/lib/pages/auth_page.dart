import 'package:fitbitter/fitbitter.dart';
import 'package:app_monjour/pages/login_page.dart';
import 'package:app_monjour/pages/welcomepage.dart';
import 'package:flutter/gestures.dart';
import 'package:app_monjour/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:drop_cap_text/drop_cap_text.dart';

class AuthPage extends StatelessWidget {
  AuthPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'AuthPage';

  @override
  Widget build(BuildContext context) {
    print('${AuthPage.routename} built');
    return Scaffold(
      backgroundColor: Color.fromARGB(249, 0, 150, 136),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).popAndPushNamed('/login_page');
             /* Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => LoginPage())); */ 
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        title: const Text('Authorization'),
          titleTextStyle:
        TextStyle(color: Colors.white, fontSize: 18, fontWeight:FontWeight.bold),
        centerTitle: true,
        backgroundColor: Color.fromARGB(249, 0, 150, 136)),
        /* backgroundColor: Colors.transparent, */
      
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            ElevatedButton(
              onPressed: () async {
                // Authorize the app
                String? userId = await FitbitConnector.authorize(
                  context: context,
                  clientID: '238K7K',
                  clientSecret: '03f4d2224ecdbb1ba000ac92355813cf',
                  redirectUri: 'monjour://fitbit/auth',
                  callbackUrlScheme: 'monjour',
                );
              },
              style: ElevatedButton. styleFrom(primary: Colors.white,fixedSize: Size(280, 25)),
              child:Text('Please authorize the app to use your data!',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color.fromARGB(249, 0, 150, 136), fontSize: 13, fontWeight:FontWeight.bold),),
            ),
            SizedBox(
              height: 80,
            ),
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Enter",
                      style: TextStyle(
                          fontSize: 21,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, "/home_page");
                      },
                      child: Container(
                        width: 70,
                        height: 55,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [Color.fromARGB(249, 0, 150, 136).withAlpha(150), Color.fromARGB(249, 0, 150, 136).withAlpha(215)]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "MonJour",
                            style: TextStyle(fontSize: 13, color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  } //build

} //build

/* void _toLoginPage(BuildContext context) async {
  final sp = await SharedPreferences.getInstance();
  sp.remove('username');

  //Pop the drawer first
  Navigator.pop(context);
  //Then pop the HomePage
  Navigator.of(context).pushReplacementNamed(WelcomePage.route);
} //_toLoginPage
 */