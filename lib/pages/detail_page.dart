
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/providers/detail_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';


class DetailWidget extends ConsumerWidget{

  final int showId;


  const DetailWidget({super.key, required this.showId,});




  Widget genreCard(String genre){

    return Card(
      color: Colors.blueGrey,
      child: Text(
        genre,
        style: TextStyle(
          color: Colors.red,
          fontSize: 15.0
        ),
      ),
    );

  }










  @override
  Widget build(BuildContext context, WidgetRef ref) {



    final show = ref.watch(detailPageShowProvider(showId));

    return show.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text('Error fetching details: $err')),
      data: (currentShow){

        if(currentShow==null){
          return Text('Error occurred, show is null');
        }



        return Scaffold(
          appBar: AppBar(
            title: const Text('Show Details'),
          ),
          backgroundColor: Colors.lightBlue[900],
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                currentShow.posterURL,
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
                padding: const EdgeInsets.all(8),
                child: SizedBox(
                  height: MediaQuery.sizeOf(context).height*0.243,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        currentShow.imageURL,
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
                                      currentShow.title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        color: Colors.lime,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),

                                  const SizedBox(width: 8),

                                  FavoriteButton(
                                    showId: currentShow.showID,
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                children: [
                                  const Icon(Icons.star),
                                  const SizedBox(width: 4),
                                  Text(currentShow.rating.toString()),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.circle, size: 4),
                                  const SizedBox(width: 8),
                                  Text(
                                    '${currentShow.runTimeStart} - ${currentShow.runTimeEnd}',
                                  ),
                                ],
                              ),

                              const SizedBox(height: 12),

                              Wrap(
                                spacing: 6,
                                runSpacing: 6,
                                children: currentShow.genres
                                    .map((genre) => genreCard(genre))
                                    .toList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
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
                    color: Colors.amber,
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 15, 20, 10),
                  child: SingleChildScrollView(
                    child: Text(
                      currentShow.summary,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal:24),
                child: Text(
                  '${currentShow.timeOfShowing} on ${currentShow.daysOfShowing} ● '
                      '${currentShow.network} ● '
                      '${currentShow.status} ● '
                      '${currentShow.runtime} mins',
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
        );

      }
    );


  }
}