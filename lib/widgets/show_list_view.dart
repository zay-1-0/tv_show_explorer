import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/show_card.dart';

import 'package:tv_show_explorer/classes/show.dart';

class ShowListView extends StatelessWidget {

  final ScrollController? scrollController;
  final List<Show> shows;
  final bool? isHome;
  final bool? isFavorite;
  final bool? isSearch;
  final String? query;




  const ShowListView({super.key,required this.shows, this.scrollController, this.isHome, this.isFavorite, this.isSearch, this.query});

  @override
  Widget build(BuildContext context) {

    return (shows.isEmpty && (isFavorite??false))? Center(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 112,
                    width: 112,
                    decoration: BoxDecoration(
                      color: Color(0xff2d2b2b).withValues(alpha: 0.10),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite_border, size: 68, color: Color(0xffec3013)),
                  ),

                  const SizedBox(height: 24),

                  Text(
                    'No favorites yet',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffec3013),
                      shadows: [
                        Shadow(
                          color: Color(0x30000000),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),

                  Text(
                    'Go to the Home page or search Page to find some shows you may like',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: Color(0xffec3013),
                      shadows: [
                        Shadow(
                          color: Color(0x30000000),
                          offset: Offset(0, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ]
            )
        )
    )
     : ListView.builder(
      controller: scrollController,
      itemCount: (isSearch??false)? shows.length+2 : shows.length+1,
      itemBuilder: (context,index) {
        int offset= (isSearch??false)? 1:0;
        if((isSearch??false)){
          if(index==0){
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 6,),

                Text(
                  'Showing results for: \' ${query!} \' ',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color(0xff2d2b2b),
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),

                SizedBox(height: 8,),

                Divider(
                  color: Color(0xff2d2b2b),
                  thickness: 4,
                  indent: 14,
                  endIndent: 14,
                ),

              ],
            );
          }
        }
        if (index < shows.length-offset) {
          final show = shows[index-offset];
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
                  'That\'s everything you\'ve liked. Go to the home or search page to favorite more shows',
                style: TextStyle(
                  color: Color(0xff3e1914),
                  fontSize: 17,
                ),
                textAlign: TextAlign.center,
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
