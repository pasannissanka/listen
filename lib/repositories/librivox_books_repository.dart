import 'package:Listen/model/audiobook_lv_API.dart';
import 'package:Listen/repositories/librivox_api_client.dart';
import 'package:flutter/cupertino.dart';

class LibrivoxBooksRepository {
  final LibrivoxAPIClient librivoxAPIClient;

  LibrivoxBooksRepository({@required this.librivoxAPIClient})
      : assert(librivoxAPIClient != null);

  Future<List<AudioBookLVAPI>> getBooksbyID(String id) async {
    try {
      final booksAPI = await librivoxAPIClient.getBookByID(id);
      for (var i = 0; i < booksAPI.length; i++) {
        final url =
            await librivoxAPIClient.getBookArtwork(booksAPI[i].urlLibrivox);
        booksAPI[i].thumbUrl = url;
      }
      return booksAPI;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<AudioBookLVAPI>> getBooksbyGenre(List<String> genres) async {
    try {
      final booksAPI = await librivoxAPIClient.getBookByGenre(genres);
      for (var i = 0; i < booksAPI.length; i++) {
        final url =
            await librivoxAPIClient.getBookArtwork(booksAPI[i].urlLibrivox);
        booksAPI[i].thumbUrl = url;
      }
      return booksAPI;
    } catch (e) {
      throw Exception(e);
    }
  }
}
