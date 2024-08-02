import 'package:katalog_film/models/item.dart';

class MoviesData {
  static final MoviesData _instance = MoviesData._internal();

  factory MoviesData() {
    return _instance;
  }

  MoviesData._internal();
  // Movies Data
  List<Item> items = [
    Item(
        name: "Marvel's Avengers",
        production: 'Marvel',
        rating: 5,
        desc: 'Keren',
        image: 'avengers.jpg'),
    Item(
        name: "Marvel's Avengers: Infinity War",
        production: 'Marvel',
        rating: 5,
        desc: 'Keren',
        image: 'infinity_war.jpg'),
    Item(
        name: "Marvel's Avengers: Endgame",
        production: 'Marvel',
        rating: 5,
        desc: 'Keren',
        image: 'endgame.jpg'),
    Item(
        name: "Blue Beetle",
        production: 'DC Comics',
        rating: 5,
        desc: 'Keren',
        image: 'blue_beetle.jpg'),
    Item(
        name: "The Dark Knight",
        production: 'DC Comics',
        rating: 5,
        desc: 'Keren',
        image: 'dark_knight.jpg'),
    Item(
        name: "Suicide Squad",
        production: 'DC Comics',
        rating: 5,
        desc: 'Keren',
        image: 'suicide_squad.jpg'),
  ];
}
