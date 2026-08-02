import 'package:tv_show_explorer/classes/show.dart';

class HomePageData {

  List<Show> shows;
  int pageNumber;


  HomePageData({ required this.shows, required this.pageNumber });

  HomePageData copyWith(List<Show> data, int newPageNum){

    return HomePageData(shows: data, pageNumber: newPageNum);

  }

}