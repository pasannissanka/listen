import 'package:Listen/bloc_observer.dart';
import 'package:Listen/blocs/books_fetch_bloc.dart';
import 'package:Listen/repositories/librivox_api_client.dart';
import 'package:Listen/repositories/librivox_books_repository.dart';
import 'package:Listen/ui/player/overlay_player_bottom.dart';
import 'package:Listen/ui/shared/tab_navigation_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

void main() {
  Bloc.observer = SimpleBlocObserver();
  final LibrivoxBooksRepository librivoxBooksRepository = LibrivoxBooksRepository(
    librivoxAPIClient: LibrivoxAPIClient(httpClient: http.Client()),
  );
  runApp(MyApp(librivoxBooksRepository: librivoxBooksRepository,));
}

class MyApp extends StatelessWidget {
  final LibrivoxBooksRepository librivoxBooksRepository;

  const MyApp({Key key, this.librivoxBooksRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listen - Audiobooks and EBooks',
      theme: ThemeData.light(),
      home: BlocProvider(
        create: (context) => AudioBooksBloc(librivoxBooksRepository: librivoxBooksRepository),
        child: App(),
      ),
    );
  }
}

class App extends StatefulWidget {
  App({Key key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _currentIndex = 0;
  bool _bottomPlayer = true;


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text('Listen', style: TextStyle(color: Colors.black),),
        ),
        body: Stack(children: <Widget>[
          Center(
            child: TabNavigationItem.items.elementAt(_currentIndex).page,
          ),
          _bottomPlayer
              ? Positioned(
                  //top: 100,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: OverlayPlayerBottom(),
                )
              : Container(),
        ]),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: Colors.blue,
          onTap: (int index) => {setState(() => _currentIndex = index)},
          items: [
            for (final tabItem in TabNavigationItem.items)
              BottomNavigationBarItem(icon: tabItem.icon, title: tabItem.title)
          ],
        ),
      ),
    );
  }
}
