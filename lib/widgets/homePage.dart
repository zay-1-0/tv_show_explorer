import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:tv_show_explorer/widgets/showCard.dart';


import '../classes/show.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}








class _HomePageState extends State<HomePage> {

  late List<Show> shows=[];
  int id = 0;
  int offset=10;
  final controller=ScrollController();
  late Future<void> showFuture;
  bool isLoaded=false;
  bool isLoading=false;



  Future<void> setUpShows() async{

    for(int count=0 ; count<offset ; count++) {

      Uri url = Uri.https('api.tvmaze.com', 'shows/$id');
      Response response = await get(url);

      if (response.statusCode == 200) {
        Show toAdd=Show(showID: id);
        await toAdd.setData();
        setState(() {
          shows.add(toAdd);
        });

      }else{
        count--;
      }
      setState(() {
        id++;
      });
    }

    isLoaded=true;
    print(shows);

  }

  Future<void> addShows() async{

    if(!isLoaded)return;
    if(isLoading)return;

    isLoading=true;



    for(int count=0 ; count<offset ; count++) {

      Uri url = Uri.https('api.tvmaze.com', 'shows/$id');
      Response response = await get(url);

      if (response.statusCode == 200) {
        Show toAdd=Show(showID: id);
        await toAdd.setData();
        setState(() {
          shows.add(toAdd);
        });
      }else{
        count--;
      }

      setState(() {
        id++;
      });
    }

    isLoading=false;



  }








  @override
  void initState() {
    super.initState();
    setUpShows();
    
    controller.addListener((){
      if(controller.position.maxScrollExtent==controller.offset){
        addShows();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Home — Popular Shows',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      body: ListView.builder(
          controller: controller,
          itemCount: shows.length+1,
          itemBuilder: (context,index){
            if(index<shows.length) {
              final show = shows[index];
              return showCard(currShow: show,);
            }else{
              return Padding(
                padding: EdgeInsets.all(8),
                child: Center(child: CircularProgressIndicator(),),
              );
            }
          },
      ),
    );
  }
}


//ListView.builder(itemBuilder: (context,index){
//         final Show show=shows[index];
//
//       }),