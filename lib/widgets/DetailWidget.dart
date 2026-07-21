import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DetailWidget extends StatelessWidget{

  late String title;
  late String imageURL;
  late double rating;
  late int runTime_Start;
  late int runTime_End;
  late List<String> genres;
  late String summary;
  late String timeOfShowing;
  late List<String> daysOfShowing;
  late String network;
  late String status;
  late int runtime;

  void setData() async{

    Uri url=Uri.https('api.tvmaze.com','shows/1');
    Response response= await get(url);
    Map data= jsonDecode(response.body);

    title=data['name'];
    imageURL=data['image']['medium'];
    rating=data['rating']['average'];
    runTime_Start=int.parse(data['premiered'].toString().substring(0,4));
    runTime_End=   (data['ended'].toString().compareTo('null')==0) ?    0      : int.parse(data['ended'].toString().substring(0,4));
    genres=List<String>.from(data['genres']);
    summary=data['summary'];
    timeOfShowing= data['schedule']['time'];
    daysOfShowing=List<String>.from(data['schedule']['days']);
    network=data['network']['name'];
    status= runTime_End==0 ? 'Running' : 'Ended';
    runtime = data['runtime'];

    print(runtime);


  }


  @override
  Widget build(BuildContext context) {
    setData();
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://static.tvmaze.com/uploads/images/medium_portrait/0/1.jpg'),

            Column(
              children: [
                Text(
                  'Under The Dome',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.lime,

                  ),
                ),

                Row(
                  children: [
                    Icon(Icons.star),
                    Text(
                        ''
                    )

                  ],

                ),
              ],

            )

          ],
        ),

      ],

    );
  }

}