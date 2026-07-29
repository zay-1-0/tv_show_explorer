import 'package:flutter/material.dart';
import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/pages/detail_page.dart';
import 'package:tv_show_explorer/pages/favorites_page.dart';
import 'package:tv_show_explorer/pages/home_page.dart';
import 'package:tv_show_explorer/pages/search_page.dart';
import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/services/database_service.dart';

void main() async {
  await _setup();
  runApp(const MyApp());
}

Future<void> _setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.setup();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  Show? _show;
  int _selectedPage=0;
  late final List<Widget> _pages;
  bool _isShowingDetails=false;
  final ApiService _apiService= ApiService();

  @override
  void dispose() {

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pages = [
      HomePage(
        apiService: _apiService,
        didSelectShow: _openDetails,
      ),
      SearchPage(
        didSelectShow: _openDetails,
        apiService: _apiService,
      ),
      FavoritesPage(
        didSelectShow: _openDetails,
      ),
    ];
  }

  void _openDetails(Show show) {
    setState(() {
      _show = show;
      _isShowingDetails = true;
    });
  }


  @override
  Widget build(BuildContext context) {




    return  MaterialApp(
      title: 'TV Show Explorer',
      home: Navigator(
        pages: [
          MaterialPage(
            key: const ValueKey('MainPage'),
            child: Scaffold(
              bottomNavigationBar: NavigationBar(
                selectedIndex: _selectedPage,
                onDestinationSelected: (index) {
                  setState(() {
                    _selectedPage = index;
                  });
                },
                destinations: const [
                  NavigationDestination(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  NavigationDestination(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                ],
              ),
              body: IndexedStack(
                index: _selectedPage,
                children: _pages,
              ),
            ),
          ),

          if (_show != null && _isShowingDetails)
            MaterialPage(
              key: const ValueKey('DetailsPage'),
              child: DetailWidget(showId: _show!.showID, apiService: _apiService,),
            ),
        ],
        onDidRemovePage: (page) {
          if (page.key == const ValueKey('DetailsPage')) {
            setState(() {
              _show = null;
              _isShowingDetails = false;
            });
          }
        },
      ),
    );
  }
}
