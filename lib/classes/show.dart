
import 'dart:convert';

import 'package:http/http.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/services/databaseService.dart';


part 'show.g.dart';

@Collection()
class Show{

  late Id showID;
  late String title;
  late String imageURL;
  late String posterURL;
  late double rating;
  late int runTimeStart;
  late int runTimeEnd;
  late List<String> genres;
  late String summary;
  late String timeOfShowing;
  late List<String> daysOfShowing;
  late String network;
  late String status;
  late int runtime;

  @Index(type: IndexType.value)
  bool isFavorite=false;

  Show({required this.showID});

  Future<void> setData() async{

    Uri url=Uri.https('api.tvmaze.com','shows/$showID');
    Response response= await get(url);
    Map data= jsonDecode(response.body);

    Uri posterUrl=Uri.https('api.tvmaze.com', 'shows/$showID/images');
    Response posterResponse=await get(posterUrl);
    List<dynamic> posterData=jsonDecode(posterResponse.body);
    final bg = posterData.firstWhere(
          (img) => img['type'] == 'background',
      orElse: () => posterData.first,
    );

     posterURL=bg['resolutions']['original']['url'];

    //print(posterResponse.body.replaceAll('[', '').replaceAll(']', '').split('}},').indexOf());
    //print(posterURL);



    title=data['name'];
    imageURL=data['image']['medium'];
    rating=data['rating']['average'].toDouble();
    runTimeStart=int.parse(data['premiered'].toString().substring(0,4));
    runTimeEnd=   (data['ended'].toString().compareTo('null')==0) ? 0  : int.parse(data['ended'].toString().substring(0,4));
    genres=List<String>.from(data['genres']);
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    summary=data['summary'].replaceAll(exp, '');
    timeOfShowing= data['schedule']['time'];
    daysOfShowing=List<String>.from(data['schedule']['days']);
    network=data['network']==null ? 'No Network Data' : data['network']['name'] ?? 'No Network Data';
    status= runTimeEnd==0 ? 'Running' : 'Ended';
    runtime = data['runtime']?? 0;

    if(showID==1 || showID==5 || showID == 8){
      isFavorite=true;
    }

    await Databaseservice.db.writeTxn(() async{
      await Databaseservice.db.shows.put(this);
    });




  }

  @override
  String toString() {

    return title + showID.toString();
  }

}