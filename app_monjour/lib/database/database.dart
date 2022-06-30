//Imports that are necessary to the code generator of floor
import 'dart:async';

import 'package:app_monjour/database/daos/activityDao.dart';

import 'package:app_monjour/database/entities/activity.dart';
import 'package:floor/floor.dart';
import 'package:app_monjour/database/typeConverters/dateTimeConverter.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@TypeConverters([DateTimeConverter])
@Database(version: 3, entities: [Activity])
abstract class AppDatabase extends FloorDatabase {
  //Add all the daos as getters here
  ActivityDao get activityDao;

}//AppDatabase
