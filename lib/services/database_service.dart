import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../classes/show.dart';

class DatabaseService {

  static late final Isar db;

  static Future<void> setup() async{


    final appDir= await getApplicationDocumentsDirectory();
    db=await Isar.open(
      [
        ShowSchema,
      ],
      directory: appDir.path,
    );
  }

  static Future<void> putShowsinDatabase(List<Show> showsToAdd) async {

    await DatabaseService.db.writeTxn(() async {
      showsToAdd.forEach((show)=> db.shows.put(show));
    });
  }



}