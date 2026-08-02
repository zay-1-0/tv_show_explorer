
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/providers/main_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';

import '../classes/show.dart';

class ShowCard extends ConsumerWidget
{
  final Show currShow;
  const ShowCard({super.key, required this.currShow,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return SizedBox(
      height: 280,
      child: InkWell(
        onTap: () {
            ref.read(selectedShowProvider.notifier).selectNewShow(currShow);
        },
        child: Card(
          color: Colors.indigoAccent[100],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: double.infinity,
                  child: Image.network(
                    currShow.imageURL,
                    fit: BoxFit.cover,
                    errorBuilder: (context, exception, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.red,
                          size: 50,
                        ),
                      );
                    },
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currShow.title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amberAccent,
                              size: 30,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              currShow.rating.toString(),
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.amberAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                FavoriteButton(
                  showId: currShow.showID,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
