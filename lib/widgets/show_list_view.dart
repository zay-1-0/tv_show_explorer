import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';

import '../classes/show.dart';

class ShowListView extends StatelessWidget {

  final ScrollController? scrollController;
  final List<Show> shows;
  final bool? isSearch;
  final bool? isHome;
  final bool? isFavorites;



  const ShowListView({super.key,required this.shows, this.scrollController, this.isSearch, this.isFavorites, this.isHome});

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      controller: scrollController,
      itemCount: shows.length+1,
      itemBuilder: (context,index){
        if(index<shows.length) {
          final show =  shows[index];
          return ShowCard(currShow: show,);
        }else if(isHome??false){
          return Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator(),),
          );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
