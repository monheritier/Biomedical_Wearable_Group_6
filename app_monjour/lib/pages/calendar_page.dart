import 'dart:math';

import 'package:app_monjour/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:time_planner/time_planner.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<TimePlannerTask> tasks = [];

  void _addObject(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(
              day: Random().nextInt(14),
              hour: Random().nextInt(18) + 6,
              minutes: Random().nextInt(60)),
          minutesDuration: Random().nextInt(90) + 30,
          daysDuration: Random().nextInt(4) + 1,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You click on time planner object')));
          },
          child: Text(
            'Running time',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
          
        ),
      );
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text(
            'Surprise!\nRandom task added to your activity planner.\nFind it and enjoy!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).popAndPushNamed('/home_page');
              /* Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage())); */ 
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
        backgroundColor: Color.fromARGB(255, 246, 246, 128),
        title:Text('Your activity planner'),
        titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold),
        centerTitle: true,
      ),
      body: Center(
        child: TimePlanner(
          startHour: 6,
          endHour: 23,
          headers: const [
            TimePlannerTitle(
              date: "07/01/2022",
              title: "Fry",
            ),
            TimePlannerTitle(
              date: "08/02/2022",
              title: "Sat",
            ),
            TimePlannerTitle(
              date: "07/03/2022",
              title: "Sun",
            ),
            TimePlannerTitle(
              date: "07/04/2022",
              title: "Mon",
            ),
            TimePlannerTitle(
              date: "07/05/2022",
              title: "Tue",
            ),
            TimePlannerTitle(
              date: "07/06/2022",
              title: "Wed",
            ),
            TimePlannerTitle(
              date: "07/07/2022",
              title: "Thu",
            ),
            TimePlannerTitle(
              date: "07/08/2022",
              title: "Fry",
            ),
            TimePlannerTitle(
              date: "07/09/2022",
              title: "Sat",
            ),
            TimePlannerTitle(
              date: "07/10/2022",
              title: "Sun",
            ),
            TimePlannerTitle(
              date: "07/11/2022",
              title: "Mon",
            ),
            TimePlannerTitle(
              date: "07/12/2022",
              title: "Tue",
            ),
            TimePlannerTitle(
              date: "07/13/2022",
              title: "Wed",
            ),
            TimePlannerTitle(
              date: "07/14/2022",
              title: "Thu",
            ),
            TimePlannerTitle(
              date: "07/15/2022",
              title: "Fry",
            ),
            TimePlannerTitle(
              date: "07/16/2022",
              title: "Sat",
            ),
            TimePlannerTitle(
              date: "07/17/2022",
              title: "Sun",
            ),
            TimePlannerTitle(
              date: "07/18/2022",
              title: "Mon",
            ),
            TimePlannerTitle(
              date: "07/19/2022",
              title: "Tue",
            ),
            TimePlannerTitle(
              date: "07/20/2022",
              title: "Wed",
            ),
            TimePlannerTitle(
              date: "07/21/2022",
              title: "Thu",
            ),
            TimePlannerTitle(
              date: "07/22/2022",
              title: "Fry",
            ),
            TimePlannerTitle(
              date: "07/23/2022",
              title: "Sat",
            ),
            TimePlannerTitle(
              date: "07/24/2022",
              title: "Sun",
            ),
            TimePlannerTitle(
              date: "07/25/2022",
              title: "Mon",
            ),
            TimePlannerTitle(
              date: "07/26/2022",
              title: "Tue",
            ),
            TimePlannerTitle(
              date: "07/27/2022",
              title: "Wed",
            ),
            TimePlannerTitle(
              date: "07/28/2022",
              title: "Thu",
            ),
            TimePlannerTitle(
              date: "07/29/2022",
              title: "Fry",
            ),
            TimePlannerTitle(
              date: "07/30/2022",
              title: "Sat",
            ),
            TimePlannerTitle(
              date: "07/31/2022",
              title: "Sun",
            ),
          ],
          tasks: tasks,
          style: TimePlannerStyle(
            dividerColor: Colors.black,
            showScrollBar: true,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 246, 246, 128),
        onPressed: () => _addObject(context),
        tooltip: 'Add random task',
        child: Icon(Icons.add,color: Colors.black,size: 35),
      ),
    );
  }
}
