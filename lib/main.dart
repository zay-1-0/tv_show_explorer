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


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
       home: FavoritesPage()
      // Navigator(
      //   pages: [
      //     MaterialPage(child: HomePage()),
      //
      //   ],
      // ),
    );
  }
}
