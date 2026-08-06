import 'package:flutter/material.dart';

import '../classes/show.dart';

class GenreCard extends StatelessWidget{

  final Show currShow;
  final bool isDetails;

  const GenreCard({required this.currShow, required this.isDetails});

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

  Widget genreCardDetials(String genre){

    if(genre=='Science-Fiction')
      genre='Sci-Fi';
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
      return Wrap(
          spacing: 2,
          runSpacing: 6,
          children: currShow.genres
              .map((genre) => genreCardDetials(genre))
              .toList(),
      );
    }
    return genreCardShow();
  }

}