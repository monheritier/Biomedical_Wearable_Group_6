import 'package:app_monjour/models/heartview.dart';
import 'package:app_monjour/pages/home.dart';
import 'package:app_monjour/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fitbitter/fitbitter.dart';

import 'package:app_monjour/database/entities/activity.dart';

class HeartPage extends StatelessWidget {

  HeartPage({Key? key}) : super(key: key);

  static const route = '/';
  static const routename = 'HeartPage';

  @override
  Widget build(BuildContext context) {
    List<int?> heartvalue = [null, null, null, null, null, null, null];
    List<DateTime?> datavalue = [null, null, null, null, null, null, null];

    void _fetchheart() async {
      FitbitHeartDataManager
                    fitbitActivityDataManager =
                    FitbitHeartDataManager(
                  clientID: '238K7K',
                  clientSecret: '03f4d2224ecdbb1ba000ac92355813cf',
                
                );

      //Fetch data
                final stepsData = await fitbitActivityDataManager
                    .fetch(FitbitHeartAPIURL.weekWithUserID(
                      baseDate: DateTime.now(),
                      userID: '7ML2XV',
                  
                )) as List<FitbitHeartData>;

      print(stepsData);

      for (var i = 0; i < 7; i++) {
        heartvalue[i] = stepsData[i].minimumCardio;
        datavalue[i] = stepsData[i].dateOfMonitoring;
      }
      print(heartvalue);
      print(datavalue);
      return Provider.of<HeartView>(context, listen: false)
          .addHeart(heartvalue, datavalue);
    }

    _fetchheart();
    print('All Done!'); 
    
//Build heart chart
    return Consumer<HeartView>(builder: (context, view, child) {
      final reportHeart = _insertheart(view.datavalue, view.heartrate);
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/home_page');
              
              /* Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage()));  */
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          title: const Text('Heart Rate Monitoring'),
           titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold),
          backgroundColor: Colors.redAccent,
          centerTitle: true,
        ),
        body: Center(
            child: Container(
              width: 500,
              height: 500,
          child: SfCartesianChart(
              title: ChartTitle(text: 'Heart Rate'),
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<Heart, DateTime>>[
                     LineSeries<Heart, DateTime>(
                    dataSource: reportHeart,
                    xValueMapper: (Heart data, _) => data.x,
                    yValueMapper: (Heart data, _) => data.y,
                    width: 3,
                    name: 'Heart',
                    dataLabelSettings: DataLabelSettings(isVisible: true)),
              ]),
        )),
      );
    });
  } //build

} //build

List<Heart> _insertheart(List<DateTime?> k, List<int?> j) {
  final heartData = <Heart>[];
  for (var i = 0; i < 7; i++) {
    heartData.add(Heart(x: k[i], y: j[i]));
  }
  return heartData;
}

class Heart {
  Heart({this.x, this.y});
  final DateTime? x;
  final int? y;
}
