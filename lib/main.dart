import 'package:flutter/material.dart';
import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/pages/detailPage.dart';
import 'package:tv_show_explorer/pages/favoritesPage.dart';
import 'package:tv_show_explorer/pages/homePage.dart';
import 'package:tv_show_explorer/services/databaseService.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Databaseservice.setup();
  Show(showID: 8).setData();
  Show(showID: 5).setData();
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
            MaterialPage(child: HomePage(didSelectShow: (showID){
              setState(() {
                _showID=showID;
              });
            },)
            ),

            if(_selectedPage==1)
              MaterialPage(child: Text('Hey')),

            if(_selectedPage==2)
              MaterialPage(child: FavoritesPage(didSelectShow: (showID){
                setState(() {
                  _showID=showID;
                });
              },)
              ),

            if(_showID!=0)
              MaterialPage(child: DetailWidget(showID: _showID))
          ],
          onPopPage: (route,result){
            _showID=0;
            return route.didPop(result);
          },
        ),
      ),
    );
  }
}
