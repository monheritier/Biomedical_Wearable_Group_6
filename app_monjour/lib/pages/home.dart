import 'package:app_monjour/pages/auth_page.dart';
import 'package:app_monjour/pages/calendar_page.dart';
import 'package:app_monjour/pages/heart_page.dart';
import 'package:app_monjour/pages/today_target_detail_page.dart';
import 'package:app_monjour/pages/welcomepage.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:flutter/gestures.dart';
import 'package:app_monjour/theme/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const route = '/home_page';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    void _unhautorize() async {
      await FitbitConnector.unauthorize(
        clientID: '238K7K',
        clientSecret: '03f4d2224ecdbb1ba000ac92355813cf',
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/auth_page');
              /* Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AuthPage())); */
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.white,
          ),
          title: Text('MonJour'),
          centerTitle: true,
          shadowColor: Colors.cyan[100],
          backgroundColor: Color.fromARGB(255, 0, 150, 136),
          actions: [
            IconButton(
                onPressed: () async {
                  _unhautorize();
                  Navigator.of(context).popAndPushNamed('/login_page');
                },
                icon: Icon(Icons.exit_to_app)),
          ]),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome Back, Marco!",
                      style: TextStyle(fontSize: 14, color: black),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(180, 0, 150, 136),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(child: InkWell(
                    child:Icon(Icons.accessibility_rounded),
                  onTap: () {
                    
                    Navigator.popAndPushNamed(context, '/profile_page');
                    
                  })),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Visualize your activities:",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: secondary.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.run_circle),
                    Text(
                      "Weekly Activities",
                      style: TextStyle(
                          fontSize: 17,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.popAndPushNamed(context, '/ActivityPage');
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Check it!",
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.red[300],
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.heart_broken_sharp),
                    Text(
                      "Heart Rate Monitoring",
                      style: TextStyle(
                          fontSize: 17,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).popAndPushNamed('/HeartPage');
                        /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HeartPage())); */
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Check it!",
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Organize your activities:",
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: black),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 246, 246, 128),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.calendar_month),
                    Text(
                      "Your personal calendar",
                      style: TextStyle(
                          fontSize: 17,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).popAndPushNamed('/calendar_page');
                        /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CalendarPage())); */
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Open it!",
                            style: TextStyle(fontSize: 13, color: white),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(165, 77, 243, 86),
                  borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.sports_gymnastics),
                    Text(
                      "Workout program",
                      style: TextStyle(
                          fontSize: 17,
                          color: black,
                          fontWeight: FontWeight.w600),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).popAndPushNamed('/today_target_detail');
                        /* Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => UserWorkoutPage())); */
                      },
                      child: Container(
                        width: 70,
                        height: 35,
                        decoration: BoxDecoration(
                            gradient:
                                LinearGradient(colors: [secondary, primary]),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Open it!",
                            style: TextStyle(fontSize: 13, color: white),
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
    ));
  }
}
