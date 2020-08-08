import 'dart:convert';
import 'package:Listen/model/book_librivox_API.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';

class LibrivoxAPIClient {
  static const baseURL = "https://librivox.org/api/feed/audiobooks";

  final http.Client httpClient;

  LibrivoxAPIClient({@required this.httpClient}) : assert(httpClient != null);

  Stream<BookLibrivoxAPI> getBookByID(String id) async* {
    final url = '$baseURL/?id=$id&format=json';
    try {
      final res = await httpClient.get(url);
      var books = jsonDecode(res.body)['books'] as List;
      for (var book in books) {
        yield BookLibrivoxAPI.fromJson(book);
      }
    } catch (e) {
      throw Exception('ERROR: librivox getBookByAPI req $e');
    }
  }

  Stream<BookLibrivoxAPI> getBookByGenre(List<String> genres) async* {
    String genre = "";
    for (var i in genres) {
      genre += '&genre=$i';
    }
    final url = Uri.encodeFull('$baseURL/?$genre&format=json');
    try {
      final res = await httpClient.get(url);
      var books = jsonDecode(res.body)['books'] as List;
      for (var book in books) {
        yield BookLibrivoxAPI.fromJson(book);
      }
    } catch (e) {
      throw Exception('ERROR: librivox getBookByGenre req $e');
    }
  }

  Stream<String> getBookArtwork(String librivoxURL) async* {
    try {
      final res = await httpClient.get(librivoxURL);
      var doc = parse(res.body).getElementsByClassName('download-cover')[0];
      yield (doc.attributes['href']);
    } catch (e) {
      throw Exception('ERROR: librivox getBookArtwork req $e');
    }
  }
}
