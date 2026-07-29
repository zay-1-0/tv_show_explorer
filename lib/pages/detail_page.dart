
import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';

import '../classes/show.dart';
import '../services/api_service.dart';
import '../services/database_service.dart';

class DetailWidget extends StatefulWidget{

  final int showId;
  final ApiService apiService;


  const DetailWidget({super.key, required this.showId, required this.apiService});

  @override
  State<DetailWidget> createState() => _DetailWidgetState();
}

class _DetailWidgetState extends State<DetailWidget> {

  bool _isLoading=true;
  late Show? show;




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



  @override
  void initState() {
    super.initState();
    _loadShow();
  }

  Future<void> _loadShow() async {
    // Load show from database
    show = await DatabaseService.db.shows.get(widget.showId);

    if (show == null) return;

    // Fetch poster if needed
    if (show!.posterURL.isEmpty) {
      final url = await widget.apiService.fetchPosterUrl(widget.showId);

      if (url != null) {
        show!.posterURL = url;

        await DatabaseService.db.writeTxn(() async {
          await DatabaseService.db.shows.put(show!);
        });
      }
    }

    // Reload from database so we have the updated posterURL
    show = await DatabaseService.db.shows.get(widget.showId);

    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });
  }




  @override
  Widget build(BuildContext context) {


    if (_isLoading || show == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    final currentShow = show!;

        return Scaffold(
          appBar:AppBar(title: Text('Show Details'),) ,
          backgroundColor: Colors.lightBlue[900],
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.network(
                      height: 200,
                        currentShow.posterURL,
                      fit: BoxFit.fill,
                    ),

                  ConstrainedBox(
                    constraints: BoxConstraints(maxHeight: 230),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(currentShow.imageURL),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(14, 10, 8, 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                        currentShow.title,
                                        style: TextStyle(
                                          fontSize: 15.0,
                                          color: Colors.lime,

                                        ),
                                      ),


                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(70, 0, 0, 0),
                                      child: FavoriteButton(showId: currentShow.showID, isDetails: true,),

                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Icon(Icons.star),
                                    Text(
                                      currentShow.rating.toString(),

                                    ),
                                    Icon(Icons.circle, size: 3.0,),
                                    Text(
                                        '${currentShow.runTimeStart}-${currentShow.runTimeEnd}'
                                    )
                                  ],
                                ),

                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                  child: Wrap(
                                    children:
                                    currentShow.genres.map((genre) => genreCard(genre)).toList(),
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

                  SizedBox(
                    height: 240,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 15, 15, 10),
                      child: SingleChildScrollView(
                        child: Text(
                            currentShow.summary,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.amber,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  ),

                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 100
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child:
                          Text(
                            '${currentShow.timeOfShowing} on ${currentShow.daysOfShowing} ● ${currentShow.network} ● ${currentShow.status} ● ${currentShow.runtime.toString()} mins',
                          style: TextStyle(
                            fontSize: 17.0,
                              fontWeight: FontWeight.w500
                            ),
                          ),


                    ),
                  )




                ],

              )

        );
  }
}