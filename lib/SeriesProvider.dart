import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'Model/Serie.dart';

class SeriesProvider extends ChangeNotifier {
  List<Serie> seriesData = [];
  Serie? selected;
  bool isLoading = true;

  Future<void> fetchSeries() async {
    final response = await http.get(
      Uri.parse('https://imdb-top-100-movies.p.rapidapi.com/'),
      headers: {
        'X-Rapidapi-Key': '75cf39f115msh5e1388559e7e8fap1b360fjsn8f1509e8c0ea',
        'X-Rapidapi-Host': 'imdb-top-100-movies.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      seriesData = data.map((item) => Serie.fromJson(item)).toList();
    }

    isLoading = false;
    notifyListeners();
  }

  void select(Serie serie) {
    selected = serie;
    notifyListeners();
  }
}