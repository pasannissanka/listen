import 'dart:convert';
import 'package:Listen/model/audiobook_lv_API.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';



class LibrivoxAPIClient {
  static const baseURL = "https://librivox.org/api/feed/audiobooks";

  final http.Client httpClient;

  LibrivoxAPIClient({@required this.httpClient}) : assert(httpClient != null);

  Future<List<AudioBookLVAPI>> getBookByID(String id) async {
    final url = '$baseURL/?id=$id&format=json';
    try {
      final res = await httpClient.get(url);
      return _parseBooksAPI(res.body);
    } catch (e) {
      throw Exception('ERROR: librivox getBookByID req $e');
    }
  }

  Future<List<AudioBookLVAPI>> getBookByGenre(List<String> genres) async {
    String genre = "";
    for (var i in genres) {
      genre += '&genre=$i';
    }
    final url = Uri.encodeFull('$baseURL/?$genre&format=json&limit=10');
    try {
      final res = await httpClient.get(url);
      return _parseBooksAPI(res.body);
    } catch (e) {
      throw Exception('ERROR: librivox getBookByGenre req $e');
    }
  }

  Future<String> getBookArtwork(String librivoxURL) async {
    try {
      final res = await httpClient.get(librivoxURL);
      var doc = parse(res.body).getElementsByClassName('download-cover')[0];
      return (doc.attributes['href']);
    } catch (e) {
      throw Exception('ERROR: librivox getBookArtwork req $e');
    }
  }

  List<AudioBookLVAPI> _parseBooksAPI(String responseBody) {
    final parsed = json.decode(responseBody)['books'].cast<Map<String, dynamic>>();
    return parsed
        .map<AudioBookLVAPI>((json) => AudioBookLVAPI.fromJson(json))
        .toList();
  }
  
}
