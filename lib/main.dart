import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:tv_show_explorer/classes/show.dart';
import 'package:tv_show_explorer/pages/detail_page.dart';
import 'package:tv_show_explorer/pages/favorites_page.dart';
import 'package:tv_show_explorer/pages/home_page.dart';
import 'package:tv_show_explorer/pages/search_page.dart';
import 'package:tv_show_explorer/providers/main_page_provider.dart';
import 'package:tv_show_explorer/services/api_service.dart';
import 'package:tv_show_explorer/services/database_service.dart';

void main() async {
  await _setup();
  runApp(ProviderScope(child: const MyApp()));
}

Future<void> _setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.instance.registerSingleton(ApiService());
  GetIt.instance.registerSingletonAsync<DatabaseService>(() async =>DatabaseService().setup());
  await GetIt.instance.allReady();
}


class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {


  Show? show;
  int _selectedPage=0;
  late final List<Widget> _pages;



  @override
  void dispose() {

    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(
      ),
      SearchPage(
      ),
      FavoritesPage(
      ),

    ];

  }



  @override
  Widget build(BuildContext context) {

    final show = ref.watch(selectedShowProvider);




    return  MaterialApp(
        title: 'TV Show Explorer',
        home: PopScope<Object?>(
          canPop: show==null,
          onPopInvokedWithResult: (bool didPop, Object? result) async{
            if (!didPop && show != null) {
              ref.read(selectedShowProvider.notifier).deselectShow();
            }

          },
          child: Navigator(
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

            if (show!=null)
              MaterialPage(
                key: const ValueKey('DetailsPage'),
                canPop: false,
                child: DetailWidget(showId: show.showID,),

              ),
          ],
          onDidRemovePage: (page) {
            if (page.key == const ValueKey('DetailsPage')) {
              ref.read(selectedShowProvider.notifier).deselectShow();
            }
          },
        ),
      )
      )
    ;
  }
}
