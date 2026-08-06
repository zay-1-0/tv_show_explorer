
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/providers/main_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';
import 'package:tv_show_explorer/widgets/genre_card.dart';

import '../classes/show.dart';

class ShowCard extends ConsumerWidget
{
  final Show currShow;
  const ShowCard({super.key, required this.currShow,});

  @override
  Widget build(BuildContext context, WidgetRef ref) {


    return showCard(ref, context);

  }




  Widget showCard(
      WidgetRef ref,
      BuildContext context
      ){

    return SizedBox(
      height: 150,
      child: InkWell(
        onTap: () {
          ref.read(selectedShowProvider.notifier).selectNewShow(currShow);
        },
        child: Container(

            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: Color(0xffa29e9e),
                        width: 2
                    )
                )
            ),


          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.24,
                  //height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4,vertical: 0),
                    child: Image.network(
                      currShow.imageURL,
                      fit: BoxFit.contain,
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
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                          child: Text(
                            currShow.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff2f0701)
                            ),
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xff7c1405),
                              size: 20,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              currShow.rating.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xff7c1405),
                                fontWeight: FontWeight.w500,
                              ),
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: GenreCard(currShow: currShow, isDetails: false),
                            ),
                          ],
                        ),


                      ],
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                  child: FavoriteButton(
                    show: currShow,
                  ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
