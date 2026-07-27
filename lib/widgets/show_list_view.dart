import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';

import '../classes/show.dart';

class ShowListView extends StatelessWidget {

  final ScrollController scrollController;
  final List<Show> shows;
  final ValueChanged<int> didSelectShow;
  final bool isSearch;



  const ShowListView({super.key,required this.shows, required this.scrollController, required this.didSelectShow, required this.isSearch});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      controller: scrollController,
      itemCount: shows.length+1,
      itemBuilder: (context,index){
        if(index<shows.length) {
          final show =  shows[index];
          return ShowCard(currShow: show, didSelectShow: (showID){
            didSelectShow(showID);
          },);
        }else if(!isSearch){
          return Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator(),),
          );
        }
      },
    );;
  }
}
