

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/classes/home_page_data.dart';
import 'package:tv_show_explorer/controllers/home_page_controller.dart';

import '../classes/show.dart';


import 'package:tv_show_explorer/widgets/show_list_view.dart';




final homePageControllerProvider = AsyncNotifierProvider<HomePageController, HomePageData>((){
  return HomePageController();
});

class HomePage extends ConsumerStatefulWidget {


  const HomePage({super.key,});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}


class _HomePageState extends ConsumerState<HomePage> {

  final scrollController=ScrollController();
  late HomePageController _homePageController;
  late AsyncValue<HomePageData> _homePageData;


  @override
  void initState() {
    super.initState();

    
    scrollController.addListener((){
      if(scrollController.position.maxScrollExtent==scrollController.offset){
        _homePageController.loadShows();
      }
    });

  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _homePageController= ref.watch(homePageControllerProvider.notifier);
    _homePageData=ref.watch(homePageControllerProvider);


    return _homePageData.when(
      loading: () =>  homePageWidget(true, [], scrollController),
      error: (err, stack) => Center(child: Text('Error fetching details: $err')),
      data: (shows)=> homePageWidget(false, shows.shows, scrollController)
    );

  }

  Widget homePageWidget(
      bool isLoading,
      List<Show> shows,
      ScrollController scrollController
      ){
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Home — Popular Shows',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28.0,
            ),
          ),
        ),
        body: Skeletonizer(
            enabled: isLoading,
            child: ShowListView(shows: shows, scrollController: scrollController,isHome: true,)
        )


    );

  }
}

