import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';

import '../classes/show.dart';

class ShowListView extends StatelessWidget {

  final ScrollController? scrollController;
  final List<Show> shows;
  final bool? isHome;
  final bool? isFavorite;




  const ShowListView({super.key,required this.shows, this.scrollController, this.isHome, this.isFavorite});

  @override
  Widget build(BuildContext context) {

    return (shows.isEmpty && (isFavorite??false))? Center(
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Text('No Favorites. Go to the Home page or search Page to find some shows you may like',
          style: TextStyle(
              fontSize: 26,
              color: Colors.black,
              fontWeight: FontWeight.w400
          ),
        ),
      ),
    ) : ListView.builder(
      controller: scrollController,
      itemCount: shows.length+1,
      itemBuilder: (context,index) {
        if (index < shows.length) {
          final show = shows[index];
          return ShowCard(currShow: show,);
        } else if (isHome ?? false) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator(),),
          );
        }else if(isFavorite??false){
          return Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(
              child: Text(
                  'That\'s everything saved so far',
                style: TextStyle(
                  color: Color(0xff3e1914),
                  fontSize: 17
                ),
              ),
            ),
          );
        }else{
          return const SizedBox.shrink();
        }
      },
    );
  }
}
