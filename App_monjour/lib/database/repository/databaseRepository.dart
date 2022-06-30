//import 'dart:io';

import 'package:app_monjour/database/database.dart';
import 'package:app_monjour/database/entities/activity.dart';
import 'package:flutter/material.dart';

class DatabaseRepository extends ChangeNotifier{
  final AppDatabase database;
  
  //Default constructor
  DatabaseRepository({required this.database});

  //This method wraps the findAllMeals() method of the DAO
  Future<List<Activity>> findAllActivity() async{
    final results = await database.activityDao.findAllActivity();
    return results;
  }//findAllActivity

  Future<void> insertActivity(Activity activity)async {
    await database.activityDao.insertActivity(activity);
    notifyListeners();
  }//insertActivity

  Future<void> deleteActivity(Activity activity) async{
    await database.activityDao.deleteActivity(activity);
    notifyListeners();
  }//removeActivity

  Future<void> updateActivity (Activity activity) async{
    await database.activityDao.updateActivity(activity);
    notifyListeners();
  }//updateActivity

}//DatabaseRepository