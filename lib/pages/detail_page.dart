
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/providers/detail_page_provider.dart';
import 'package:tv_show_explorer/providers/favorites_provider.dart';
import 'package:tv_show_explorer/widgets/genre_card.dart';

import '../classes/show.dart';


class DetailWidget extends ConsumerWidget{

  final int showId;


  const DetailWidget({super.key, required this.showId,});



  @override
  Widget build(BuildContext context, WidgetRef ref) {



    final show = ref.watch(detailPageShowProvider(showId));

    return show.when(
      loading: ()  {
        return detailPage(context, null, true, ref);
      },
      error: (err, stack) => Center(child: Text('Error fetching details: $err')),
      data: (currentShow){

       return detailPage(context, currentShow, false, ref);

      }
    );


  }

  Widget detailPage(
      BuildContext context,
      Show? currentShow,
      bool isLoading,
      WidgetRef ref
      ){

    final isFavorite=ref.watch(isFavoriteProvider(currentShow!.showID));

    return Scaffold(
          backgroundColor: Color(0xfff3f2f2),
          body: Skeletonizer(
            enabled: isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.network(
                  currentShow?.posterURL??'',
                  height: 200,
                  fit: BoxFit.cover,
                  errorBuilder: (context, exception, stackTrace) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.red,
                          size: 50,
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(
                    height: MediaQuery.sizeOf(context).height*0.18,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [

                                        SizedBox(width: 20,),

                                        Expanded(
                                          child: Text(
                                            currentShow?.title??'',
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 26,
                                              color: Color(0xff2d2b2b),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),

                                      ],
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            SizedBox(width: 8,),

                                            const Icon(
                                              Icons.star,
                                              color: Color(0xff7c1405),
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              currentShow?.rating.toString()??'',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Color(0xff7c1405),
                                              ),
                                            ),
                                            const SizedBox(width: 16),
                                            Text(
                                              '${currentShow?.runTimeStart??''} - ${currentShow?.runTimeEnd??''}',
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  color: Color(0xff2d2b2b),
                                                fontWeight: FontWeight.w500
                                              ),
                                            ),

                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 14),
                                                child: GenreCard(currShow: currentShow!, isDetails: true),
                                              ),
                                            )
                                          ],
                                        ),
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                    ),
                  ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 26),
                    child: SingleChildScrollView(
                      child: Text(
                        currentShow?.summary??'',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color(0xff2d2b2b),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 12,),

                Divider(
                  color: Color(0xff9f9d9d),
                  thickness: 4,
                  indent: 14,
                  endIndent: 14,
                ),
                ListTile(
                  leading: Text(
                    'Schedule',
                    style: TextStyle(
                      color: Color(0xff262626),
                      fontSize: 20
                    ),
                  ),

                  trailing: Text(
                    '${currentShow?.daysOfShowing.first??''}, ${currentShow?.timeOfShowing??''}',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),
                ),

                Divider(
                  color: Color(0x889f9d9d),
                  thickness: 4,
                  indent: 24,
                  endIndent: 24,
                ),

                ListTile(
                  leading: Text(
                    'Network',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),

                  trailing: Text(
                    currentShow?.network??'',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),
                ),

                Divider(
                  color: Color(0x889f9d9d),
                  thickness: 4,
                  indent: 24,
                  endIndent: 24,
                ),

                ListTile(
                  leading: Text(
                    'Status',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),

                  trailing: Text(
                    currentShow?.status??'',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),
                ),

                Divider(
                  color: Color(0x889f9d9d),
                  thickness: 4,
                  indent: 24,
                  endIndent: 24,
                ),

                ListTile(
                  leading: Text(
                    'Runtime',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),

                  trailing: Text(
                    '${currentShow?.runtime??''} mins',
                    style: TextStyle(
                        color: Color(0xff262626),
                        fontSize: 20
                    ),
                  ),
                ),

                SizedBox(height: 38,),

                Center(
                  child: ElevatedButton.icon(
                    style:  ElevatedButton.styleFrom(
                      shape: LinearBorder(),
                      fixedSize: Size(MediaQuery.sizeOf(context).width*0.8, 30),
                      backgroundColor: isFavorite? Color(0xffdd2b0f) : Color(0xffeae9e9),
                      shadowColor: Color(0xffaa210b),
                      elevation: 8
                    ),
                    icon: Icon(
                      Icons.favorite,
                      color: isFavorite? Color(0xfff3f2f2) : Color(0xffdd2b0f),
                    ),
                    label: Text(
                      isFavorite? 'Remove from favorites': 'Add to favorites',
                      style: TextStyle(
                        color: isFavorite? Color(0xfff3f2f2) : Color(0xffdd2b0f),
                      ),
                    ),
                    onPressed: (){


                      if(isFavorite) {
                        ref.read(favoriteControllerProvider.notifier).removeFavorite(currentShow);
                      } else {
                        ref.read(favoriteControllerProvider.notifier).addFavorite(currentShow);
                      }
                    },
                  ),
                ),





              ],
            ),
          ),
    );

  }
}