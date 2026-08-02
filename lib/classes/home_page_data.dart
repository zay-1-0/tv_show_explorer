import 'package:tv_show_explorer/classes/show.dart';

class HomePageData {

  List<Show> shows;
  int pageNumber;
  bool isLoading;


  HomePageData({ required this.shows, required this.pageNumber, this.isLoading=false });

  HomePageData copyWith({List<Show>? data, int? newPageNum, bool? isLoading}){

    return HomePageData(shows: data??shows, pageNumber: newPageNum??pageNumber, isLoading: isLoading??this.isLoading);

  }

}