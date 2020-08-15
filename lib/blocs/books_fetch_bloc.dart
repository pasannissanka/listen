import 'dart:collection';

import 'package:Listen/model/audiobook_lv_API.dart';
import 'package:Listen/repositories/librivox_books_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AudioBooksFetchEvent extends Equatable {
  const AudioBooksFetchEvent();
}

class AudioBooksFetchRequested extends AudioBooksFetchEvent {
  final List<String> genres;
  const AudioBooksFetchRequested({@required this.genres}): assert(genres != null);

  @override
  List<Object> get props => [genres];
}

class AudioBooksRefreshRequested extends AudioBooksFetchEvent {
  final List<String> genres;
  const AudioBooksRefreshRequested({@required this.genres}): assert(genres != null);

  @override
  List<Object> get props => [genres];
}

abstract class AudioBooksState extends Equatable {
  const AudioBooksState();

  @override
  List<Object> get props => [];
}

class AudioBooksInitial extends AudioBooksState {}

class AudioBooksLoadInProgress extends AudioBooksState {}

class AudioBooksLoadSuccess extends AudioBooksState {
  // final List<AudioBookLVAPI> audioBooks;
  final HashMap<int,AudioBookLVAPI> audioBooks;

  const AudioBooksLoadSuccess({@ required this.audioBooks}) : assert(audioBooks != null);

  @override
  List<Object> get props => [audioBooks];
}

class AudioBooksLoadFailure extends AudioBooksState {}

class AudioBooksBloc extends Bloc<AudioBooksFetchEvent, AudioBooksState> {
  final LibrivoxBooksRepository librivoxBooksRepository;

  AudioBooksBloc({@required this.librivoxBooksRepository})
    : assert(librivoxBooksRepository != null),
      super(AudioBooksInitial());

  @override
  Stream<AudioBooksState> mapEventToState(AudioBooksFetchEvent event) async* {
    if (event is AudioBooksFetchRequested) {
      yield* _mapBooksRequestedToState(event);
    }
  }

  Stream<AudioBooksState> _mapBooksRequestedToState(AudioBooksFetchRequested event) async* {
    yield AudioBooksLoadInProgress();
    try {
      final HashMap<int,AudioBookLVAPI>  books = await librivoxBooksRepository.getBooksbyGenre(event.genres);
      yield AudioBooksLoadSuccess(audioBooks: books);
    } catch (e) {
      yield AudioBooksLoadFailure();
    }
  }

  
  
}



