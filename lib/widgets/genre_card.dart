import 'package:flutter/material.dart';

import 'package:tv_show_explorer/classes/show.dart';

class GenreCard extends StatelessWidget{

  final Show currShow;
  final bool isDetails;

  const GenreCard({super.key, required this.currShow, required this.isDetails});

  Widget genreCardShow(){
    if(currShow.genres.isNotEmpty) {
      return Card(
        shape: ContinuousRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFec3013), // Your chosen border color
            width: 2.0,          // Border thickness
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            currShow.genres.first,
            style: TextStyle(
                color: Color(0xFFec3013)
            ),
          ),
        ),
      );
    }
    return SizedBox.shrink();
  }

  Widget genreCardDetails(String genre){

    if(genre=='Science-Fiction') {
      genre='Sci-Fi';
    }
    return Card(
      shape: ContinuousRectangleBorder(
        side: const BorderSide(
          color: Color(0xFFec3013),
          width: 2.0,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Text(
          genre,
          style: TextStyle(
              color: Color(0xFFec3013)
          ),
        ),
      ),
    );

  }


  @override
  Widget build(BuildContext context) {
    if(isDetails) {
      return SizedBox(
        height: 40,
        child: Scrollbar(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: currShow.genres
                  .map((genre) => genreCardDetails(genre))
                  .toList(),
            ),
            
          ),
        ),
      );
    }
    return genreCardShow();
  }

}