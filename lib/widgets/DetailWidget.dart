
import 'package:flutter/material.dart';

import '../classes/Movie.dart';

class DetailWidget extends StatefulWidget{


  const DetailWidget({super.key});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {

  static late Movie movie;
  late Future<void> movieFuture;



  Widget genreCard(String genre){

    return Card(
      child: Text(
        genre,
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.0
        ),
      ),
      color: Colors.blueGrey,
    );

  }

  Future<void> setUpMovie() async {
    Movie currMovie=Movie(showID: 1);
    await currMovie.setData();
    setState(() {
      movie=currMovie;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    movieFuture = setUpMovie();
  }




  @override
  Widget build(BuildContext context) {



        return Scaffold(
          appBar:AppBar(title: Text('Show Details'),) ,
          backgroundColor: Colors.lightBlue[900],
          body: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.network(
              //     movie.posterURL,
              //   scale: 0.5,
              //
              // ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.network(movie.imageURL),

                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            movie.title,
                            style: TextStyle(
                              fontSize: 15.0,
                              color: Colors.lime,

                            ),
                          ),
                        ),

                        Row(
                          children: [
                            Icon(Icons.star),
                            Text(
                              movie.rating.toString(),

                            ),
                            Icon(Icons.circle, size: 3.0,),
                            Text(
                                '${movie.runTimeStart}-${movie.runTimeEnd}'
                            )
                          ],
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                          child: Wrap(
                            children:
                            movie.genres.map((genre) => genreCard(genre)).toList(),
                            spacing: 3,
                            runSpacing: 10,
                            direction: Axis.vertical,
                          ),
                        )
                      ],

                    )

                  ],
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
                    movie.summary,
                  style: TextStyle(
                    fontSize: 20.0,
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
                    Text('${movie.timeOfShowing} on ${movie.daysOfShowing}',
                    style: TextStyle(
                      fontSize: 17.0,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                    Icon(Icons.circle,size: 5.0,),
                    Text(movie.network,
                      style: TextStyle(
                          fontSize: 17.0,
                        fontWeight: FontWeight.w500
                      ),),
                    Icon(Icons.circle,size: 5.0,),
                    Text(movie.status,
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500
                      ),),
                    Icon(Icons.circle,size: 5.0,),
                    Text('${movie.runtime.toString()} mins',
                      style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500
                      ),)

                  ],
                ),
              )
          
          
          
          
            ],
          
          ),
        );
  }
}