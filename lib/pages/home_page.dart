

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:tv_show_explorer/classes/home_page_data.dart';
import 'package:tv_show_explorer/controllers/home_page_controller.dart';

import 'package:tv_show_explorer/classes/show.dart';

import 'package:tv_show_explorer/widgets/empty_state_view.dart';
import 'package:tv_show_explorer/widgets/show_sliver_list.dart';




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
      loading: () =>  homePageWidget(true, []),
      error: (err, stack) => _scaffold([
        SliverFillRemaining(
          hasScrollBody: false,
          child: EmptyStateView(
            icon: Icons.wifi_off_rounded,
            title: 'Couldn\'t load shows',
            message: 'Check your connection and try again.',
            actionLabel: 'Retry',
            onAction: () => ref.invalidate(homePageControllerProvider),
          ),
        ),
      ]),
      data: (shows)=> homePageWidget(false, shows.shows)
    );

  }

  Widget homePageWidget(
      bool isLoading,
      List<Show> shows,
      ){
    return _scaffold([
      Skeletonizer.sliver(
          enabled: isLoading,
          child: ShowSliverList(shows: shows, isHome: true,)
      ),
    ]);

  }

  Widget _scaffold(List<Widget> bodySlivers){
    return Scaffold(
        body: CustomScrollView(
          controller: scrollController,
          slivers: [
            const SliverAppBar.large(
              title: Text('Popular Shows'),
              pinned: true,
            ),
            ...bodySlivers,
          ],
        )
    );
  }
}

