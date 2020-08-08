
import 'dart:async';

import 'package:Listen/blocs/books_fetch_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:Listen/ui/shared/list/list_widget_horiz.dart';
import 'package:Listen/ui/shared/list/list_widget_verti.dart';
import 'package:flutter/material.dart';

class HomePageView extends StatefulWidget {
  HomePageView({Key key}) : super(key: key);

  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  Completer<void> _requestCompleter;

  @override
  void initState() {
    super.initState();
    if (!(BlocProvider.of<AudioBooksBloc>(context).state is AudioBooksLoadSuccess)) {
      BlocProvider.of<AudioBooksBloc>(context).add(AudioBooksFetchRequested(genres: ["Children's Fiction"]));
    }
    _requestCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: BlocConsumer<AudioBooksBloc,AudioBooksState>(
         listener: (context , state) {
           if (state is AudioBooksLoadSuccess) {
            //  BlocProvider.of<AudioBooksBloc>(context).add(AudioBooksFetchRequested(genres: ["Children's Fiction"]));
            _requestCompleter?.complete();
            _requestCompleter = Completer();
           }
         },
         builder: (context, state) {
           if (state is AudioBooksLoadInProgress) {
             return Center(
               child:  CircularProgressIndicator(),
             );
           }
           if (state is AudioBooksLoadSuccess) {
             final books = state.audioBooks;
              return ListView(
                children: List.generate(books.length, (i) => ListWidgetVerticle(librivoxBook: books[i],)),
              );
           }
           if (state is AudioBooksLoadFailure) {
             return Center(
               child: Text('Something went wrong'),
             );
           }
           return Text('test');
         },
       ),
    );
  }

  // List<Widget> childrenW = List.generate(
  //   10,
  //   (index) => ListWidgetVerticle(),
  // );

  Widget _horizontalNav() {
    return Container(
      margin: EdgeInsets.all(2),
      height: 200,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
              10,
              (index) => ListWidgetHorizontal(
                    id: 52,
                    thumbnail: Image.network(
                        'https://ia802809.us.archive.org/12/items/LibrivoxCdCoverArt12/Letters_Two_Brides_1110.jpg'),
                    title: "Letters of Two Brides",
                    authorName: "Honoré de Balzac",
                  ))),
    );
  }
}
