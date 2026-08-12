
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tv_show_explorer/providers/main_page_provider.dart';
import 'package:tv_show_explorer/widgets/favorite_button.dart';
import 'package:tv_show_explorer/widgets/genre_card.dart';

import 'package:tv_show_explorer/classes/show.dart';

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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
      child: InkWell(
        onTap: () {
          ref.read(selectedShowProvider.notifier).selectNewShow(currShow);
        },
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color(0x306E6EFF),
              width: 2,
            ),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfffffdfa),
                Color(0xfff2d8cf),
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.13),
                blurRadius: 5,
                offset: const Offset(4, 8),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.34,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6,vertical: 12),
                  child: Image.network(
                    currShow.imageURL,
                    fit: BoxFit.contain,
                    errorBuilder: (context, exception, stackTrace) {
                      return const Center(
                        child: Icon(
                          Icons.broken_image,
                          color: Colors.red,
                          size: 80,
                        ),
                      );
                      },
                  ),
                ),
              ),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 26,),

                      Text(
                        currShow.title,
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff2f0701)
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),

                      const SizedBox(height: 4),

                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Color(0xff7c1405),
                            size: 22,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            currShow.rating.toString(),
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xff7c1405),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GenreCard(currShow: currShow, isDetails: false),
                      ),
                    ],
                  ),
                ),
              ),

              Transform.translate(
                offset: Offset(-14, 18),
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
