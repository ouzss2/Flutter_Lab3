import 'package:flutter/material.dart';

import 'Model/Serie.dart';
class SeriesProvider extends ChangeNotifier {
  final List<Serie> seriesData = [Serie(
    'Breaking Bad',
    'assets/breaking.jpg',
    'A chemistry teacher diagnosed with cancer starts cooking meth to secure his family\'s future.',
  ),
  Serie(
    'Stranger Things',
    'assets/breaking.jpg',
    'A group of kids in a small town face supernatural forces and secret experiments.',
  ),
  Serie(
    'Game of Thrones',
    'assets/breaking.jpg',
    'Noble families fight for control of the Iron Throne in the land of Westeros.',
  ),];
  Serie? selected;

  void select(Serie serie) {
    selected = serie;
    notifyListeners();
  }
}