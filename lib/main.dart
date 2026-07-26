import 'package:flutter/material.dart';
import 'package:isar_community/isar.dart';
import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/pages/detailPage.dart';
import 'package:tv_show_explorer/pages/favoritesPage.dart';
import 'package:tv_show_explorer/pages/homePage.dart';
import 'package:tv_show_explorer/pages/searchPage.dart';
import 'package:tv_show_explorer/services/databaseService.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Databaseservice.setup();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

enum CurrentPage{
  HomePage,
  SearchPage,
  FavoritesPage,
}

class _MyAppState extends State<MyApp> {


  int _showID=0;
  int _selectedPage=0;
  bool _isShowingDetails=false;

  @override
  void dispose() {

    super.dispose();
  }


  @override
  Widget build(BuildContext context) {




    return MaterialApp(
      title: 'Flutter Demo',
       home: //FavoritesPage()
      Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _selectedPage,
          onDestinationSelected: (int index){
            setState(() {
              _selectedPage=index;
              _isShowingDetails=false;
            });
          },
          destinations: [
            NavigationDestination(icon: Icon(Icons.home_filled), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.search), label: 'Search'),
            NavigationDestination(icon: Icon(Icons.favorite), label: 'Favorites'),
          ],
        ),
        body: Navigator(
          pages: [
            if(_selectedPage==0)
            MaterialPage(key: ValueKey('HomePage'),child: HomePage(didSelectShow: (showID){
              setState(() {
                _showID=showID;
                _isShowingDetails=true;
              });
            },
            )
            ),

            if(_selectedPage==1)
              MaterialPage(key: ValueKey('SearchPage'), child: SearchPage(didSelectShow: (showID){
                setState(() {
                  _showID=showID;
                  _isShowingDetails=true;
                });
              },)),

            if(_selectedPage==2)
              MaterialPage(key: ValueKey('FavoritesPage'), child: FavoritesPage(didSelectShow: (showID){
                setState(() {
                  _showID=showID;
                  _isShowingDetails=true;
                });
              },)
              ),

            if(_showID!=0 && _isShowingDetails)
              MaterialPage(key:ValueKey('DetailsPage'),  child: DetailWidget(showID: _showID))
          ],
          onDidRemovePage: (page){
            if(page.key==const ValueKey('DetailsPage'))
            {
              _showID=0;
              _isShowingDetails=false;
            }

          },
        ),
      ),
    );
  }
}
