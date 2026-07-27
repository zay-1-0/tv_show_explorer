
import 'dart:convert';

import 'package:http/http.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/services/database_service.dart';


part 'show.g.dart';

@Collection()
class Show{


  final Id showID;
  final String title;
  final String imageURL;
  //final String posterURL;
  final double rating;
  final int runTimeStart;
  final int runTimeEnd;
  final List<String> genres;
  final String summary;
  final String timeOfShowing;
  final List<String> daysOfShowing;
  final String network;
  final String status;
  final int runtime;

  @Index(type: IndexType.value)
  bool isFavorite=false;

  Show({required this.showID, required this.title, required this.imageURL,  required this.rating, required this.runTimeStart, required this.runTimeEnd, required this.genres, required this.summary, required this.timeOfShowing, required this.daysOfShowing, required this.network, required this.status, required this.runtime});

  // Future<void> setData() async{
  //
  //   Uri url=Uri.https('api.tvmaze.com','shows/$showID');
  //   Response response= await get(url);
  //   print(response.body.runtimeType);
  //   Map data= jsonDecode(response.body);
  //
  //   Uri posterUrl=Uri.https('api.tvmaze.com', 'shows/$showID/images');
  //   Response posterResponse=await get(posterUrl);
  //   List<dynamic> posterData=jsonDecode(posterResponse.body);
  //   final bg = posterData.firstWhere(
  //         (img) => img['type'] == 'background',
  //     orElse: () => posterData.first,
  //   );
  //
  //    posterURL=bg['resolutions']['original']['url'];
  //
  //   //print(posterResponse.body.replaceAll('[', '').replaceAll(']', '').split('}},').indexOf());
  //   //print(posterURL);
  //
  //
  //
  //   title=data['name']?? 'No title available';
  //   imageURL=data['image']?['medium']?? '';
  //   rating=data['rating']?['average']?? '';
  //   runTimeStart=int.tryParse(data['premiered']?.substring(0,4))??0;
  //   runTimeEnd=  int.tryParse(data['ended']?.substring(0,4))?? 0;
  //   genres=List<String>.from(data['genres']??[]);
  //   RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
  //   summary=data['summary']?.replaceAll(exp, '')??'';
  //   timeOfShowing= data['schedule']?['time']?? '';
  //   daysOfShowing=List<String>.from(data['schedule']?['days']??[]);
  //   network=data['network']?['name']?? '';
  //   status= runTimeEnd==0 ? 'Running' : 'Ended';
  //   runtime = data['runtime']?? 0;
  //
  //   await Databaseservice.db.writeTxn(() async{
  //     await Databaseservice.db.shows.put(this);
  //   });
  //
  //
  //
  //
  // }

  factory Show.fromJson(Map data){

    String tempSummary;
    RegExp exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    tempSummary=data['summary']?.replaceAll(exp, '')??'';
    return Show(
        showID: data['id']??0,
        title: data['name']??'',
        imageURL: data['image']?['medium']?? '',
        //posterURL: posterURL,
        rating: data['rating']?['average']?? 0.0,
        runTimeStart: int.tryParse(data['premiered']?.substring(0,4))??0,
        runTimeEnd:  int.tryParse(data['ended']?.substring(0,4))?? 0,
        genres:List<String>.from(data['genres']??[]),
        summary: tempSummary,
        timeOfShowing: data['schedule']?['time']?? '',
        daysOfShowing:List<String>.from(data['schedule']?['days']??[]),
        network:data['network']?['name']?? '',
        status: (int.tryParse(data['ended']?.substring(0,4))?? 0)==0 ? 'Running' : 'Ended',
        runtime : data['runtime']?? 0
    );
  }

  @override
  String toString() {

    return title+ showID.toString();
  }

}