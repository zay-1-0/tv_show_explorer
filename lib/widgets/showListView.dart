import 'package:flutter/material.dart';
import 'package:tv_show_explorer/widgets/showCard.dart';

import '../classes/show.dart';

class ShowListView extends StatefulWidget {

  final _scrollController;
  final List<Show> shows;
  final ValueChanged<int> _didSelectShow;
  final _isSearch;



  const ShowListView({super.key,required this.shows, required this._scrollController, required this._didSelectShow, required this._isSearch});

  @override
  State<ShowListView> createState() => _ShowListViewState();
}

class _ShowListViewState extends State<ShowListView> {


  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      controller: widget._scrollController,
      itemCount: widget.shows.length+1,
      itemBuilder: (context,index){
        if(index<widget.shows.length) {
          final show =  widget.shows[index];
          return showCard(currShow: show, didSelectShow: (showID){
            widget._didSelectShow(showID);
          },);
        }else if(!widget._isSearch){
          return Padding(
            padding: EdgeInsets.all(8),
            child: Center(child: CircularProgressIndicator(),),
          );
        }
      },
    );;
  }
}
