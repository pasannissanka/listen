import 'dart:collection';

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

  Future<Map<int,AudioBookLVAPI>> getBooksbyGenre(List<String> genres) async {
    try {
      final booksAPI = await librivoxAPIClient.getBookByGenre(genres);

      // Currently Creates a 50+ Requests to librivox website,
      // Bottleneck in albumart fetch request.
      
      for (var i = 0; i < booksAPI.length; i++) {
        final url =
            await librivoxAPIClient.getBookArtwork(booksAPI[i].urlLibrivox);
        booksAPI[i].thumbUrl = url;
      }
      return HashMap.fromIterable(
        booksAPI, key: (element) => int.parse(element.id),
        value: (element) => element, 
      );
    } catch (e) {
      throw Exception(e);
    }
  }
}
