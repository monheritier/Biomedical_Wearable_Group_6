import 'package:app_monjour/database/repository/databaseRepository.dart';
import 'package:app_monjour/utils/formats.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:fitbitter/fitbitter.dart';
import 'package:app_monjour/database/entities/activity.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityP extends StatelessWidget {

  ActivityP({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'ActivityPage';

  @override
  Widget build(BuildContext context) {
    print('${ActivityP.routename} built');
    return Scaffold(
      appBar: AppBar(
          title: const Text('Activity Monitoring'),
          backgroundColor: Color.fromARGB(255, 157, 206, 255).withOpacity(0.5),
          actions: [
            IconButton(
              onPressed: () async {
                FitbitActivityTimeseriesDataManager
                    fitbitActivityTimeseriesDataManager =
                    FitbitActivityTimeseriesDataManager(
                  clientID: '238K7K',
                  clientSecret: '03f4d2224ecdbb1ba000ac92355813cf',
                  type: 'steps',
                );

                //Fetch data
                final stepsData = await fitbitActivityTimeseriesDataManager
                    .fetch(FitbitActivityTimeseriesAPIURL.weekWithResource(
                  baseDate: DateTime.now(),
                  userID: '7ML2XV',
                  resource: fitbitActivityTimeseriesDataManager.type,
                )) as List<FitbitActivityTimeseriesData>;

                print(stepsData);
                for (var i = 0; i < stepsData.length; i++) {
                  double? distanza = stepsData.elementAt(i).value;
                  DateTime? date = stepsData.elementAt(i).dateOfMonitoring;
                  print(Activity(distanza!, date!).distance.toString());
                  print(Activity(distanza, date).dateOfMonitoring.toString());

                  await Provider.of<DatabaseRepository>(context, listen: false)
                      .insertActivity(Activity(distanza, date));
                }
              },
              icon: const Icon(Icons.run_circle_sharp),
            )
          ]),
      body: Center(
        child: Consumer<DatabaseRepository>(builder: (context, dbr, child) {
          return FutureBuilder(
            initialData: null,
            future: dbr.findAllActivity(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final datadistanza = snapshot.data as List<Activity>;
                return datadistanza.isEmpty
                    ? const Text('The activity list is currently empty')
                    : ListView.builder(
                        itemCount: datadistanza.length,
                        itemBuilder: (context, activityIndex) {
                          final delete = datadistanza[activityIndex];
                          //Return Activity List
                          return Card(
                            elevation: 5,
                            child: Dismissible(
                                key: UniqueKey(),
                                background: Container(
                                  color: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.centerLeft,
                                ),
                                secondaryBackground: Container(
                                  color: Colors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Icon(
                                    Icons.update,
                                    color: Colors.white,
                                  ),
                                  alignment: Alignment.centerRight,
                                ),
                                child: ListTile(
                                  leading: Icon(MdiIcons.stepForward),
                                  trailing: Icon(MdiIcons.noteEdit),
                                  title: Text(
                                      'Distance traveled: ${datadistanza[activityIndex].distance},m'),
                                  subtitle: Text(
                                      Formats.onlyDayDateFormat.format(datadistanza[activityIndex].dateOfMonitoring)),
                                  onTap: () => showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog( 
                                      //Evaluation of single daily activity
                                      title: const Text('No way!'),
                                      content: Text((() {
                                        if (datadistanza[activityIndex]
                                                .distance >
                                            10000) {
                                          return "Good Job for today!";
                                        }
                                        return "Sorry,not enough for today!";
                                      })()),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('Close'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pushNamed(
                                              context, '/pizza_page'),
                                          child:
                                              const Text('Discover yor win!'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onDismissed: (direction) async {
                                  if (direction ==
                                      DismissDirection.startToEnd) {
                                    await Provider.of<DatabaseRepository>(
                                            context,
                                            listen: false)
                                        .deleteActivity(delete);
                                    print("Item deleted");
                                  }
                                  else if (direction ==
                                      DismissDirection.endToStart) {
                                    await Provider.of<DatabaseRepository>(
                                            context,
                                            listen: false)
                                        .updateActivity(delete);
                                    print("item archived");
                                  }
                                } 
                                ),
                          );
                        });
              } //if
              else {
                return CircularProgressIndicator();
              } //else
            }, //FutureBuilder builder
          );
        } //Consumer-builder

            ),
      ),
    );
  } //build
}