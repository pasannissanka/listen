

import 'package:Listen/model/book_librivox_API.dart';
import 'package:equatable/equatable.dart';

class LibrivoxBook extends Equatable {

  final BookLibrivoxAPI bookLibrivoxAPI;
  // bookLibrivoxRSS

  String coverArtURL;

  LibrivoxBook(
    this.bookLibrivoxAPI,
    this.coverArtURL,
  );

  @override
  List<Object> get props => [
    bookLibrivoxAPI,
    coverArtURL,
  ];

  @override
  String toString() {
    return '${this.bookLibrivoxAPI.toString()}, ${this.coverArtURL}';
  }

}