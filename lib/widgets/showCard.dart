
import 'package:flutter/material.dart';
import 'package:tv_show_explorer/services/databaseService.dart';

import '../classes/show.dart';

class showCard extends StatefulWidget {
  final Show currShow;
  final ValueChanged<int> didSelectShow;
  const showCard({super.key, required this.currShow, required this.didSelectShow});

  @override
  State<showCard> createState() => _showCardState();
}

class _showCardState extends State<showCard> {



  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 280,
      //width:430,
      child: InkWell(
        onTap: () => widget.didSelectShow(widget.currShow.showID) ,
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
                          widget.currShow.imageURL,
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
                                '${widget.currShow.title} - ${widget.currShow.showID}',
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
                                  widget.currShow.rating.toString(),
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
                      onPressed: () async {
                        Show? showToChange= await Databaseservice.db.shows.get(widget.currShow.showID);
                        showToChange?.isFavorite =!showToChange.isFavorite;
                        await Databaseservice.db.writeTxn(() async {
                          Databaseservice.db.shows.put(showToChange!);
                        });
                      },
                      child: Icon(
                        Icons.favorite,
                        size: 25.0,
                        color:widget.currShow.isFavorite? Colors.red : Colors.black26,
                      ),
                    ),
                  )



                ],

              ),
            )
        ),
      ),
    );
  }
}
