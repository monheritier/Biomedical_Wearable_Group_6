import 'package:app_monjour/pages/activity_page.dart';
import 'package:app_monjour/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:app_monjour/utils/detailsPage.dart';


//Page for food suggestions after your daily activity task
/* class PizzaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPizzaPage(),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}  */

class MyPizzaPage extends StatefulWidget {
  @override
  _MyPizzaPageState createState() => _MyPizzaPageState();
}

class _MyPizzaPageState extends State<MyPizzaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
                Navigator.of(context).popAndPushNamed('/ActivityPage');  
               /*  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ActivityP()));  */
            },
            icon: Icon(Icons.arrow_back_ios),
            color: Colors.black,
          ),
          title: const Text("Food Suggestions",textAlign: TextAlign.center),
            titleTextStyle:
        TextStyle(color: Colors.black, fontSize: 18, fontWeight:FontWeight.bold),
        backgroundColor:Color.fromARGB(255, 0, 206, 255).withOpacity(0.5),
      actions: [
            IconButton(
              alignment: Alignment.centerRight,
              onPressed: () {
                   Navigator.of(context).popAndPushNamed('/home_page'); 
              /*   Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => HomePage()
            )); */ 
              },
              icon: const Icon(Icons.home,color: Colors.black),
            ),
            ]
          ),

      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              
              // child: Text(
                
              //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              // ),
            ),
            Container(
            height: MediaQuery.of(context).size.height - 185.0,
          
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 157, 206, 255).withOpacity(0.5),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
              
            ),
            
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView(children: [
                          _buildFoodItem('assets/images/plate1.png', 'Salmon bowl', '/20.00£'),
                          _buildFoodItem('assets/images/plate2.png', 'Spring bowl','/25.00£'),
                          _buildFoodItem('assets/images/plate6.png', 'Avocado bowl','/30.00£'),
                          _buildFoodItem('assets/images/plate5.png', 'Berry bowl','/40.00£')
                        ]))),
                   
              ],
            ),
            
          )
            
            
    ]
        )
        
      )

    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, String price) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
        child: InkWell(
          
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  children: [
                    Hero(
                      tag: imgPath,
                      child: Image(
                        image: AssetImage(imgPath),
                        fit: BoxFit.cover,
                        height: 75.0,
                        width: 75.0
                      )
                    ),
                    SizedBox(width: 10.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:[
                        Text(
                          foodName,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17.0,
                            fontWeight: FontWeight.bold
                          )
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 15.0,
                            color: Colors.grey
                          )
                        )
                      ]
                    )
                  ]
                )
              ),
              IconButton(
                
                icon: Icon(Icons.add),
                color: Colors.black,
                onPressed: () {
                     /* Navigator.of(context).pushNamed('/details_page',arguments: DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price) );  */
             /*  Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price)
            )); */ 
          },
                
              )
            ],
          )
        ));
  }
}