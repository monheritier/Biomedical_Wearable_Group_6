import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "Your Profile Page",
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        backgroundColor: Color.fromARGB(249, 0, 150, 136),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/images/marcorossi.jpg'),
                ),
                Text(
                  'Marco Rossi',
                  style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 25,
                  ),
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SourceSansPro',
                    color: Colors.white30,
                    letterSpacing: 2.5,
                  ),
                ),
                SizedBox(
                  height: 20.0,
                  width: 200,
                  child: Divider(
                    color: Colors.teal[100],
                  ),
                ),
                Card(
                    color: Colors.white,
                    margin:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.phone,
                        color: Colors.green[500],
                      ),
                      title: Text(
                        '+91 85465XXX8XX',
                        style:
                            TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
                      ),
                    )),
                Card(
                  color: Colors.white,
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.cake,
                      color: Colors.green[500],
                    ),
                    title: Text(
                      '08-05-1995',
                      style: TextStyle(fontSize: 20.0, fontFamily: 'Neucha'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}