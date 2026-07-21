
import 'package:flutter/material.dart';

import '../classes/Movie.dart';

class DetailWidget extends StatelessWidget{

  static final Movie movie=Movie(showID: 1);



  const DetailWidget({super.key});



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(movie.imageURL),

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