import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';


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

  Widget homeShowCard(Show currShow){

    bool favorite=false;

    return SizedBox(
      height: 280,
      //width:430,
      child: Card(
        color: Colors.black12,
          child: Padding(padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 280,
                        maxWidth: 180,
                      ),
                      child: Image.network(
                        currShow.imageURL,
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 130,
                            child: Text(
                              '${currShow.title} - ${currShow.showID}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,

                              ),
                              softWrap: true,
                              maxLines: 4,
                            ),
                          ),

                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amberAccent,
                                size: 30,
                              ),

                              Text(
                                  currShow.rating.toString(),
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.amberAccent,
                                      fontWeight: FontWeight.w500
                                  ),



                                ),
                            ],
                          ),


                        ],
                      ),
                    ),


                  ],


                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(28, 4, 0, 0),
                  child: FloatingActionButton.small(
                    backgroundColor: Colors.white,
                    onPressed: (){
                      currShow.isFavorite= !currShow.isFavorite;
                      setState(() {
                        favorite=!favorite;
                      });
                    },
                    child: Icon(
                      Icons.favorite,
                      size: 25.0,
                      color:currShow.isFavorite? Colors.red : Colors.black26,
                    ),
                  ),
                )



              ],

            ),
          )
      ),
    );



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
              return homeShowCard(show);
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