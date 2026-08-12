
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/providers/detail_page_provider.dart';
import 'package:tv_show_explorer/providers/favorites_provider.dart';
import 'package:tv_show_explorer/widgets/genre_card.dart';

import 'package:tv_show_explorer/classes/show.dart';


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

    final isFavorite=ref.watch(isFavoriteProvider(currentShow?.showID??0));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xfffff0ed),
        leading: Transform.translate(
          offset: const Offset(0, -12),
          child: const BackButton(
            color: Colors.black,
            style: ButtonStyle(
              iconSize: WidgetStatePropertyAll(24),
            ),
          ),
        ),
        toolbarHeight: 24,
      ),

          backgroundColor: Color(0xfffff0ed),
          body: Skeletonizer(
            enabled: isLoading,
            child: LayoutBuilder(
              builder: (context, viewportConstraints) {
                return Scrollbar(
                  scrollbarOrientation: ScrollbarOrientation.right,
                  thickness: 8,
                  radius: Radius.circular(18),
                  child: SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          SafeArea(
                            child: SizedBox(
                              height: MediaQuery.sizeOf(context).height*0.3,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  Image.network(
                                  currentShow?.posterURL??'',
                                  fit: BoxFit.fill,
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
                                  loadingBuilder:
                                      (
                                      BuildContext context,
                                      Widget child,
                                      ImageChunkEvent? loadingProgress,
                                      ) {
                                    if (loadingProgress == null) {
                                      return child;
                                    }
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                            loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                ),

                                  DecoratedBox(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.center,
                                        colors: [
                                          Color(0xd9000000),
                                          Color(0x73000000),
                                          Color(0x00000000),
                                        ],
                                      ),
                                    ),
                                  ),
                            
                                  Positioned(
                                    left: 14,
                                    bottom: 16,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          currentShow?.title ?? '',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 32,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),

                                        Text(
                                          '${currentShow?.runTimeStart ?? ''}${(currentShow?.runTimeEnd ?? 0) != 0 ? ' - ${currentShow?.runTimeEnd}' : ''}',
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                            
                            
                                  Positioned(
                                    left: MediaQuery.sizeOf(context).width*0.8,
                                    bottom: 20,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                      decoration: BoxDecoration(
                                        //color: Colors.black26.withValues(alpha: 0.45),
                                        borderRadius: BorderRadius.circular(999),
                                        border: Border.all(color: Colors.white.withValues(alpha: 0.45)),
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withValues(alpha: 0.05),
                                            Colors.black.withValues(alpha: 0.4),
                                            Colors.black.withValues(alpha: 0.6),
                                          ],
                                        ),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Color(0xfff3f2f2),
                                          ),
                                         SizedBox(width: 4,),
                                          Text(
                                            currentShow?.rating.toString()??'',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Color(0xfff3f2f2),
                                                fontWeight: FontWeight.w500
                                            ),
                                         ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                  
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
                            child: ReadMoreText(
                                currentShow?.summary??'',
                                trimMode: TrimMode.Line,
                                trimLines: 3,
                                colorClickableText: Color(0xffdd2b0f),
                                trimCollapsedText: 'Show more',
                                trimExpandedText: '\n Show less',
                                style:  TextStyle(
                                      fontSize: 20,
                                      color: Color(0xff2d2b2b),
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                          ),

                          Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                              child: GenreCard(currShow: currentShow??Show.empty(), isDetails: true),
                            ),

                  
                  
                          SizedBox(height: 24,),


                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                              width: MediaQuery.sizeOf(context).width*0.5,
                              decoration: BoxDecoration(
                                color: Color(0xfffffbfa),
                                border: Border.all(
                                  width: 2,
                                  color: Color(0x306E6EFF),
                                ),
                                borderRadius: BorderRadius.circular(12),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 10,
                                    spreadRadius: 1,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Card(
                                      color: Color(0xfffffbfa),
                                      elevation: 0,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Schedule',
                                            style: TextStyle(
                                                color: Color(0xff262626),
                                                fontSize: 14
                                            ),
                                          ),

                                          Text(
                                            '${currentShow?.daysOfShowing.firstOrNull??''}, ${currentShow?.timeOfShowing??''}',
                                            style: TextStyle(
                                                color: Color(0xff262626),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500
                                            ),
                                          ),
                                        ],
                                      ),
                                  ),

                                  Divider(
                                    color: Color(0x889f9d9d),
                                    thickness: 4,
                                  ),

                                  Card(
                                    color: Color(0xfffffbfa),
                                    elevation: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Network',
                                          style: TextStyle(
                                            color: Color(0xff262626),
                                            fontSize: 14,
                                          ),
                                        ),
                                        Text(
                                          currentShow?.network ?? '-',
                                          style: TextStyle(
                                            color: Color(0xff262626),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(
                                    color: Color(0x889f9d9d),
                                    thickness: 4,

                                  ),

                                  Card(
                                    color: Color(0xfffffbfa),
                                    elevation: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Status',
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 14
                                          ),
                                        ),

                                        Text(
                                          currentShow?.status??'',
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  Divider(
                                    color: Color(0x889f9d9d),
                                    thickness: 4,

                                  ),

                                  Card(
                                    color: Color(0xfffffbfa),
                                    elevation: 0,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Runtime',
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 14
                                          ),
                                        ),

                                        Text(
                                            (currentShow?.runtime != null && currentShow!.runtime != 0) ? '${currentShow.runtime} mins' : '',
                                          style: TextStyle(
                                              color: Color(0xff262626),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500

                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),

                          SizedBox(height: 52,),

                          SafeArea(
                            bottom: true,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 18),
                              child: Center(
                                child: ElevatedButton.icon(
                                  style:  ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    fixedSize: Size(MediaQuery.sizeOf(context).width*0.75, 30),
                                    backgroundColor: isFavorite? Color(0xffdd2b0f) : Color(0xfffffbfa),
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
                                      ref.read(favoriteControllerProvider.notifier).removeFavorite(currentShow!);
                                    } else {
                                      ref.read(favoriteControllerProvider.notifier).addFavorite(currentShow!);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                  
                  
                  
                        ],
                      ),
                    ),
                  ),
                );
              }
            ),
          ),
    );

  }
}