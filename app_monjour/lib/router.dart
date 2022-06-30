import 'package:app_monjour/pages/activity_page.dart';
import 'package:app_monjour/pages/auth_page.dart';
import 'package:app_monjour/pages/calendar_page.dart';
import 'package:app_monjour/pages/heart_page.dart';
import 'package:app_monjour/pages/home.dart';
import 'package:app_monjour/pages/login_page.dart';
import 'package:app_monjour/pages/pizza_page.dart';
import 'package:app_monjour/pages/profile_page.dart';

import 'package:app_monjour/pages/today_target_detail_page.dart';
import 'package:app_monjour/pages/welcomepage.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings setting) {
  final Map<String, dynamic> args = new Map<String, dynamic>();

  switch (setting.name) {
    case '/auth_page':
      return MaterialPageRoute(builder: ((context) => AuthPage()));
    case '/calendar_page':
      return MaterialPageRoute(builder: ((context) => CalendarPage()));
    case '/home_page':
      return MaterialPageRoute(builder: ((context) => HomePage()));
    case '/login_page':
      return MaterialPageRoute(builder: ((context) => LoginPage()));
    case '/ActivityPage':
      return MaterialPageRoute(builder: ((context) => ActivityP()));
    case '/HeartPage':
      return MaterialPageRoute(builder: ((context) => HeartPage()));
    case '/welcome_page':
      return MaterialPageRoute(builder: ((context) => WelcomePage()));
    case '/profile_page':
      return MaterialPageRoute(builder: ((context) => ProfilePage()));
    case '/today_target_detail':
      return MaterialPageRoute(builder: ((context) => UserWorkoutPage()));
    case '/pizza_page':
      return MaterialPageRoute(builder: ((context) => PizzaPage()));
    default:
      return MaterialPageRoute(
          builder: ((context) => Scaffold(
                body: Center(),
              )));
  }
}
