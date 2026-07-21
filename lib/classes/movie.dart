
import 'dart:convert';

import 'package:http/http.dart';

class Movie{

  late int showID;
  late String title;
  late String imageURL;
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

  Movie({required this.showID}){
    setData();
  }

  void setData() async{

    Uri url=Uri.https('api.tvmaze.com','shows/1');
    Response response= await get(url);
    Map data= jsonDecode(response.body);

    title=data['name'];
    imageURL=data['image']['medium'];
    rating=data['rating']['average'];
    runTimeStart=int.parse(data['premiered'].toString().substring(0,4));
    runTimeEnd=   (data['ended'].toString().compareTo('null')==0) ?    0      : int.parse(data['ended'].toString().substring(0,4));
    genres=List<String>.from(data['genres']);
    summary=data['summary'];
    timeOfShowing= data['schedule']['time'];
    daysOfShowing=List<String>.from(data['schedule']['days']);
    network=data['network']['name'];
    status= runTimeEnd==0 ? 'Running' : 'Ended';
    runtime = data['runtime'];



  }

}