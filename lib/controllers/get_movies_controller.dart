import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../models/movie_models.dart';

class MovieService extends GetxService {
  RxList<Movie> myMovies = <Movie>[].obs;
  RxString token = ''.obs;

  Future<void> fetchMyMovies() async {
    try {
      final response = await http.get(
        Uri.parse('http://192.168.200.19:3000/api/v1/movies/myMovies'),
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body)['data']['myMovies'];
        myMovies.assignAll(data.map((item) => Movie.fromJson(item)).toList());
        // Save the movies to shared preferences
        saveMoviesToLocal();
      } else {
        throw Exception('Failed to load movies');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> saveMoviesToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('myMovies', jsonEncode(myMovies));
  }

  Future<void> loadMoviesFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedMovies = prefs.getString('myMovies');

    if (storedMovies != null) {
      final List<dynamic> data = json.decode(storedMovies);
      myMovies.assignAll(data.map((item) => Movie.fromJson(item)).toList());
    }
  }

  Future<void> saveTokenToLocal() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', token.value);
  }

  Future<void> loadTokenFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedToken = prefs.getString('token');

    if (storedToken != null) {
      token(storedToken);
    }
  }
}
