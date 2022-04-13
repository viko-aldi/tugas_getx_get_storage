import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_getx/mixins/server.dart';
import 'package:flutter_getx/model/model.dart';

class MovieRepository {
  Future<List<Movie>> getMovie(int page) async {
    http.Response value = await http.get(
      Uri.parse(Server.alamat_api +
          "/3/movie/top_rated?api_key=${Server.api_key}" +
          "&page=$page"),
    );
    if (value.statusCode == 200) {
      Map<String, dynamic> response = json.decode(value.body);
      List<dynamic> listData = response["results"];
      List<Movie> listMovie =
          listData.map((dynamic element) => Movie.fromMap(element)).toList();
      return listMovie;
    } else {
      throw Exception();
    }
  }
}
