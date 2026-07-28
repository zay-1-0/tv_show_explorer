
import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';

import '../classes/show.dart';

class ShowCard extends StatelessWidget
{
  final Show currShow;
  final ValueChanged<Show> didSelectShow;
  const ShowCard({super.key, required this.currShow, required this.didSelectShow});

  @override
  Widget build(BuildContext context) {


    return SizedBox(
      height: 280,
      //width:430,
      child: InkWell(
        onTap: () => didSelectShow(currShow) ,
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

                      SizedBox(
                        width: 166,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 130,
                                child: Text(
                                  currShow.title,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,

                                  ),
                                  softWrap: true,
                                  maxLines: 4,
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                                child: Row(
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
                              ),


                            ],
                          ),
                        ),
                      ),


                    ],


                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
                    child: FavoriteButton(showId: currShow.showID, isDetails: false,)
                  )



                ],

              ),
            )
        ),
      ),
    );
  }
}
