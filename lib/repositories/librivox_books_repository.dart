import 'package:Listen/model/book_librivox_API.dart';
import 'package:Listen/model/librivox_book.dart';
import 'package:Listen/repositories/librivox_api_client.dart';
import 'package:flutter/cupertino.dart';

class LibrivoxBooksRepository {
  final LibrivoxAPIClient librivoxAPIClient;

  LibrivoxBooksRepository({@required this.librivoxAPIClient})
      : assert(librivoxAPIClient != null);

  Future<List<LibrivoxBook>> getBooksbyID(String id) async {
    List<LibrivoxBook> books;
    try {
      final booksAPI = librivoxAPIClient.getBookByID(id);
      booksAPI.listen((book) {
        // print('API CALL : $book');
        librivoxAPIClient.getBookArtwork(book.urlLibrivox).listen((thumbUrl) {
          // print(thumbUrl);
          final bookobj = LibrivoxBook(book, thumbUrl);
          print(bookobj);
          books.add(bookobj);
        });
      });
    } catch (e) {
      throw Exception(e);
    }
    return books;
  }

  Future<List<BookLibrivoxAPI>> getBooksbyGenre(List<String> genres) async {
    List<LibrivoxBook> books = <LibrivoxBook>[];
    // Future<List<LibrivoxBook>> future = new Future<List<LibrivoxBook>>();
    try {
      final booksAPI = librivoxAPIClient.getBookByGenre(genres);
      int count = 0;
      // booksAPI.listen(
      //   (book) {
      //     // print('API CALL : $book');
      //     librivoxAPIClient.getBookArtwork(book.urlLibrivox).listen((thumbUrl) {
      //       // print(thumbUrl);
      //       // final bookobj = LibrivoxBook(book, thumbUrl);
      //       count++;
      //       print('$count');
      //       books.add(LibrivoxBook(book, thumbUrl));
      //     });
      //   },
      // );
      return booksAPI.toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
