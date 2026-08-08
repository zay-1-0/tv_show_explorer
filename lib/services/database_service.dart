import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tv_show_explorer/classes/show.dart';

class DatabaseService {

  static late final Isar db;


  Future<DatabaseService> setup() async{


    final appDir= await getApplicationDocumentsDirectory();
    db=await Isar.open(
      [
        ShowSchema,
      ],
      directory: appDir.path,
    );
    return this;
  }

  Future<void> putShowinDatabase(Show show) async {

    await DatabaseService.db.writeTxn(() async {
      db.shows.put(show);
    });

  }

  Future<Show?> getShowFromDatabase(int showId) async{

    return await db.shows.get(showId);

  }

  Stream<List<Show>> getFavoritesStream(){

    return db.shows
        .where()
        .watch(fireImmediately: true);
  }

  Stream<Show?> getShowStream(int showId){
    return db.shows.watchObject(
      showId,
      fireImmediately: true,
    );
  }

  Future<void> deleteShow(Show show) async {
    await db.writeTxn(() async {
      await db.shows.delete(show.showID);
    });
  }

  Stream<bool> watchIsFavorite(int showId) {
    return db.shows
        .watchObject(showId, fireImmediately: true)
        .map((show) => show != null);
  }



}