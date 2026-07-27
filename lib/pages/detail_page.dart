
import 'package:flutter/material.dart';

import '../classes/show.dart';
import '../services/database_service.dart';

class DetailWidget extends StatefulWidget{

  final int showID;


  const DetailWidget({super.key, required this.showID});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {

  late Show show;
  late Future<void> showFuture;



  Widget genreCard(String genre){

    return Card(
      color: Colors.blueGrey,
      child: Text(
        genre,
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.0
        ),
      ),
    );

  }

  Future<void> setUpShow() async {
    Show currMovie=Show(showID: widget.showID);
    await currMovie.setData();
    setState(() {
      show=currMovie;
    });
  }

  @override
  void initState() {
    super.initState();
    showFuture = setUpShow();
  }




  @override
  Widget build(BuildContext context) {



        return Scaffold(
          appBar:AppBar(title: Text('Show Details'),) ,
          backgroundColor: Colors.lightBlue[900],
          body: FutureBuilder(
            future: showFuture,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState != ConnectionState.done) {
                return const Center(child: CircularProgressIndicator());
              }

              return Column(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      height: 200,
                        show.posterURL,
                      fit: BoxFit.fill,
                    ),

                  SizedBox(
                    height: 220,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(show.imageURL),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        show.title,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.lime,

                                        ),
                                      ),


                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                                      child: SizedBox(
                                        height: 26,
                                        width: 26,
                                        child: FloatingActionButton.small(

                                          backgroundColor: Colors.white,
                                          onPressed: () async {
                                            Show? showToChange= await DatabaseService.db.shows.get(show.showID);
                                            showToChange?.isFavorite =! showToChange.isFavorite;
                                            await DatabaseService.db.writeTxn(() async {
                                              DatabaseService.db.shows.put(showToChange!);
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            size: 18.0,
                                            color: show.isFavorite? Colors.red : Colors.black26,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text(
                                      show.rating.toString(),

                                    ),
                                    Icon(Icons.circle, size: 3.0,),
                                    Text(
                                        '${show.runTimeStart}-${show.runTimeEnd}'
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Wrap(
                                    children:
                                    show.genres.map((genre) => genreCard(genre)).toList(),
                                    spacing: 3,
                                    runSpacing: 10,
                                    direction: Axis.vertical,
                                  ),
                                )
                              ],

                            ),
                          )

                        ],
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 18, 10, 0),
                    child: Text(
                        'Summary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                            color: Colors.amber
                        ),
                      ),

                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
                    child: Text(
                        show.summary,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${show.timeOfShowing} on ${show.daysOfShowing}',
                        style: TextStyle(
                          fontSize: 17.0,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Icon(Icons.circle,size: 5.0,),
                        Text(show.network,
                          style: TextStyle(
                              fontSize: 17.0,
                            fontWeight: FontWeight.w500
                          ),),
                        Icon(Icons.circle,size: 5.0,),
                        Text(show.status,
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500
                          ),),
                        Icon(Icons.circle,size: 5.0,),
                        Text('${show.runtime.toString()} mins',
                          style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500
                          ),)

                      ],
                    ),
                  )




                ],

              );
            }
          ),
        );
  }
}