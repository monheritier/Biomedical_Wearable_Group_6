import 'package:flutter/material.dart';

class HeartView extends ChangeNotifier {
  List<int?> heartrate =[null, null, null, null, null, null, null];
  List<DateTime?> datavalue=[null, null, null, null, null, null, null];
  void addHeart(List<int?> rate, List <DateTime?> date)  {
    for(var i=0; i<7; i++) {
      heartrate[i]=rate[i];
      print(heartrate);
      datavalue[i]=date[i];
      }
      notifyListeners();
      }
}