import 'dart:async';

import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/services/databaseService.dart';

import '../classes/show.dart';
import '../widgets/showCard.dart';

class FavoritesPage extends StatefulWidget {

  final ValueChanged<int> didSelectShow;

  const FavoritesPage({super.key,required this.didSelectShow});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {

  final controller=ScrollController();

  List<Show> favorites=[];

  StreamSubscription? showStream;

  @override
  void initState() {
    super.initState();
    showStream= Databaseservice.db.shows.buildQuery<Show>(
      whereClauses: [
        IndexWhereClause.equalTo(
          indexName: 'isFavorite', value: [true],
        )
      ],


    ).watch(fireImmediately: true,).listen( (data) {
      setState(() {
        favorites=data;
      });
    } );



  }
@override
  void dispose() {
    showStream?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Favorites',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28.0,
          ),
        ),
      ),
      body: ListView.builder(
        controller: controller,
        itemCount: favorites.length+1,
        itemBuilder: (context,index) {
          if(index<favorites.length) {
            final show = favorites[index];
            return showCard(currShow: show,didSelectShow: (showID) {
              widget.didSelectShow(showID);
            },);

          }else if(favorites.length==0){
            return Padding(
              padding: EdgeInsets.all(8),
              child: Center(child: Text('No Favorites. Go to Home or Search Page to find some'),),
            );
          }
        },
      ),
    );;
  }
}
