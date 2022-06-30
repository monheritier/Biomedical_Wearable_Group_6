import 'package:floor/floor.dart';

//Here, we are saying to floor that this is a class that defines an entity
@entity
class Activity {
  @PrimaryKey()
  

  final double distance;
  final DateTime dateOfMonitoring;

  Activity( this.distance, this.dateOfMonitoring);
}
