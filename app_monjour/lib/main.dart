// @dart=2.9

import 'package:app_monjour/database/database.dart';
import 'package:app_monjour/database/repository/databaseRepository.dart';
import 'package:app_monjour/models/heartview.dart';
import 'package:app_monjour/pages/Introductionscreen.dart';
import 'package:app_monjour/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'router.dart' as router;
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  //This opens the database.
  final AppDatabase database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  //This creates a new DatabaseRepository from the AppDatabase instance just initialized
  final databaseRepository = DatabaseRepository(database: database);

  //Here, we run the app and we provide to the whole widget tree the instance of the DatabaseRepository.
  //That instance will be then shared through the platform and will be unique.
  runApp(ChangeNotifierProvider<DatabaseRepository>(
    create: (context) => databaseRepository,
    child: MyApp(),
  ));
} //main

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HeartView>(
      create: (context) => HeartView(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroductionScreen(),
        onGenerateRoute: router.generateRoute,
      ),
    );
  } //build
} //MyApp //MyApp
