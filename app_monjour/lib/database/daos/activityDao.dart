import 'package:app_monjour/database/entities/activity.dart';
import 'package:floor/floor.dart';

//Here, we are saying that the following class defines a dao.

@dao
abstract class ActivityDao {
  //Query #1: SELECT -> this allows to obtain all the entries of the Activity table
  @Query('SELECT * FROM Activity')
  Future<List<Activity>> findAllActivity();

  //Query #2: INSERT -> this allows to add an activity in the table
  @insert
  Future<void> insertActivity(Activity activity);

  //Query #3: DELETE -> this allows to delete an activity from the table
  @delete
  Future<void> deleteActivity(Activity task);

  //Query #4: UPDATE -> this allows to update an activity entry
  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateActivity(Activity activity);
}//ActivtyDao

