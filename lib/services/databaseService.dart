import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../classes/show.dart';

class Databaseservice {

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
}