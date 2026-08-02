

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/classes/home_page_data.dart';
import 'package:tv_show_explorer/controllers/home_page_controller.dart';


import 'package:tv_show_explorer/widgets/show_list_view.dart';




final homePageControllerProvider = StateNotifierProvider<HomePageController, HomePageData>((ref){
  return HomePageController(
    HomePageData(shows: [], pageNumber: 0),
  );
});

class HomePage extends ConsumerStatefulWidget {


  const HomePage({super.key,});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}


class _HomePageState extends ConsumerState<HomePage> {

  final scrollController=ScrollController();
  late HomePageController _homePageController;
  late HomePageData _homePageData;


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
          enabled: !_homePageData.isLoading,
          child: ShowListView(shows: _homePageData.shows, scrollController: scrollController,isHome: true,)
      )


    );
  }
}

