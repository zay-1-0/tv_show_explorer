
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/providers/detail_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';

import '../classes/show.dart';


class DetailWidget extends ConsumerWidget{

  final int showId;


  const DetailWidget({super.key, required this.showId,});




  Widget genreCard(String genre){

    return Card(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Text(
          genre,
          style: TextStyle(
            color: Colors.black87,
            fontSize: 15.0
          ),
        ),
      ),
    );

  }










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
    return Scaffold(
          appBar: AppBar(
            title: const Text('Show Details'),
          ),
          backgroundColor: Colors.lightBlue[900],
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

                Padding(
                  padding: const EdgeInsets.all(2),
                  child: Container(
                    height: MediaQuery.sizeOf(context).height*0.243,
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            currentShow?.imageURL??'',
                            errorBuilder: (context, error, stackTrace) {
                              return const SizedBox(
                                width: 120,
                                child: Center(
                                  child: Icon(Icons.broken_image, size: 50),
                                ),
                              );
                            },
                          ),

                          const SizedBox(width: 14),

                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          currentShow?.title??'',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 26,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),

                                      const SizedBox(width: 8),

                                      FavoriteButton(
                                        show: currentShow!,
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 10),

                                  Row(
                                    children: [
                                      const Icon(Icons.star),
                                      const SizedBox(width: 4),
                                      Text(
                                        currentShow?.rating.toString()??'',
                                        style: TextStyle(
                                            fontSize: 18
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      const Icon(Icons.circle, size: 10),
                                      const SizedBox(width: 8),
                                      Text(
                                        '${currentShow?.runTimeStart??''} - ${currentShow?.runTimeEnd??''}',
                                        style: TextStyle(
                                            fontSize: 18
                                        ),
                                      ),
                                    ],
                                  ),

                                  const SizedBox(height: 12),

                                  Expanded(
                                    child: Wrap(
                                      spacing: 6,
                                      runSpacing: 6,
                                      children: currentShow?.genres
                                          .map((genre) => genreCard(genre))
                                          .toList()??[],
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
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Text(
                    'Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white60,
                    ),
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                    child: SingleChildScrollView(
                      child: Text(
                        currentShow?.summary??'',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white70,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:24),
                  child: Text(
                    '${currentShow?.timeOfShowing??''} on ${currentShow?.daysOfShowing??''} ● '
                        '${currentShow?.network??''} ● '
                        '${currentShow?.status??''} ● '
                        '${currentShow?.runtime??''} mins',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

                const SizedBox(height: 50,),

              ],
            ),
          ),
    );

  }
}