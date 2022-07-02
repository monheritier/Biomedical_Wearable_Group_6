import 'package:app_monjour/pages/home.dart';
import 'package:app_monjour/utils/personalize_data.dart';
import 'package:app_monjour/widget/goal_container.dart';
import 'package:flutter/material.dart';

class UserWorkoutPage extends StatefulWidget {
  const UserWorkoutPage({Key? key}) : super(key: key);

  @override
  _UserWorkoutState createState() => _UserWorkoutState();
}

class _UserWorkoutState extends State<UserWorkoutPage> {
  Diet selectedDiet = Diet.standard;

  handleDietSelect(Diet selectedDiet) async {
    setState(() {
      this.selectedDiet = selectedDiet;
    });
    await addStringToSF(tag: USER_DIET, string: selectedDiet.toString());
  }

  @override
  void initState() {
    handleDietSelect(Diet.standard);
    super.initState();
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
          backgroundColor:Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Burn your calories',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(height: 24.0),
            GoalContainer(
              header: 'Stairs',
              subHeader: '452-670 calories per hour',
              emoticon: '',
              isSelected: selectedDiet == Diet.standard,
              onTap: () => handleDietSelect(Diet.standard),
            ),
            GoalContainer(
              header: 'Battle ropes',
              subHeader: '285-421 calories per hour',
              emoticon: '',
              isSelected: selectedDiet == Diet.eggs,
              onTap: () => handleDietSelect(Diet.eggs),
            ),
            GoalContainer(
              header: 'Power Yoga',
              subHeader: '226-335 calories per hour',
              emoticon: '',
              isSelected: selectedDiet == Diet.veg,
              onTap: () => handleDietSelect(Diet.veg),
            ),
            GoalContainer(
              header: 'Running',
              subHeader: '566-839 calories per hour',
              emoticon: '',
              isSelected: selectedDiet == Diet.vegan,
              onTap: () => handleDietSelect(Diet.vegan),
            ),
          ],
        ),
      ),
    );
  }
}

enum Diet { standard, eggs, veg, vegan }
