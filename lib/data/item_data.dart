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
        name: "The Avengers",
        production: 'Marvel',
        rating: 5,
        desc:
            "When an unexpected enemy emerges threatening global safety, Nick Fury, director of S.H.I.E.L.D., initiates a superhero recruitment project known as the Avengers. The team includes Iron Man, Captain America, Thor, Hulk, Black Widow, and Hawkeye. They must learn to work together to stop Loki and his army from starting a global war.",
        image: 'avengers.jpg',
        pgrating: 'PG-13',
        year: 2012),
    Item(
        name: "Avengers : Age of Ultron",
        production: 'Marvel',
        rating: 5,
        desc:
            "The Avengers reassemble to face Ultron, an artificial intelligence program created by Tony Stark and Bruce Banner. Ultron, with a sinister plan to wipe out humanity, must be stopped by these superheroes before it's too late.",
        image: 'avengers_aou.jpg',
        pgrating: 'PG-13',
        year: 2015),
    Item(
        name: "Avengers: Infinity War",
        production: 'Marvel',
        rating: 5,
        desc:
            "The Avengers and their allies unite to battle Thanos, an intergalactic tyrant collecting the Infinity Stones to achieve his goal of wiping out half the universe's population. This epic battle places the fate of the universe in balance.",
        image: 'infinity_war.jpg',
        pgrating: 'PG-13',
        year: 2018),
    Item(
        name: "Avengers: Endgame",
        production: 'Marvel',
        rating: 5,
        desc:
            "Following the devastation caused by Thanos in Avengers: Infinity War, the remaining Avengers strive to reverse the situation and bring back everyone who vanished. They travel through time to collect the Infinity Stones and defeat Thanos once and for all.",
        image: 'endgame.jpg',
        pgrating: 'PG-13',
        year: 2019),
    Item(
        name: "Blue Beetle",
        production: 'DC Comics',
        rating: 3,
        desc:
            "Jaime Reyes, a teenager, discovers an alien scarab that grants him superpowers and armor. With these powers, Jaime must learn to control them and protect his loved ones from impending threats.",
        image: 'blue_beetle.jpg',
        pgrating: 'PG-13',
        year: 2023),
    Item(
        name: "The Dark Knight",
        production: 'DC Comics',
        rating: 5,
        desc:
            "Batman faces a new and unexpected enemy, the Joker. With the help of Commissioner Gordon and District Attorney Harvey Dent, Batman attempts to stop the Joker, who aims to destroy Gotham City and prove that even the greatest heroes have limits.",
        image: 'dark_knight.jpg',
        pgrating: 'PG-13',
        year: 2008),
    Item(
        name: "Suicide Squad",
        production: 'DC Comics',
        rating: 4,
        desc:
            "A group of imprisoned supervillains is given a chance to reduce their sentences by undertaking dangerous missions for the government. Led by Deadshot, Harley Quinn, and Captain Boomerang, they must work together to stop a world-threatening menace.",
        image: 'suicide_squad.jpg',
        pgrating: 'PG-13',
        year: 2016),
    Item(
        name: "Batman v Superman: Dawn of Justice",
        production: 'DC Comics',
        rating: 4,
        desc:
            "The film depicts the conflict between Batman (Bruce Wayne) and Superman (Clark Kent) after Superman's battle that devastated Metropolis. Lex Luthor manipulates them to fight each other, while a new threat emerges in the form of Doomsday.",
        image: 'batmanvsuperman.jpg',
        pgrating: 'PG-13',
        year: 2016),
    Item(
        name: "Black Widow",
        production: 'Marvel',
        rating: 3,
        desc:
            'Natasha Romanoff (Black Widow) confronts the darker parts of her past when a dangerous conspiracy linked to her history emerges. Pursued by relentless forces, Natasha must face her past as a spy and the broken relationships she left behind long before becoming an Avenger.',
        image: 'black_widow.jpg',
        pgrating: 'PG-13',
        year: 2021),
    Item(
        name: "Spider-Man: No Way Home",
        production: 'Marvel',
        rating: 5,
        desc:
            "Peter Parker faces his greatest challenge when his identity as Spider-Man is revealed. Seeking help from Doctor Strange, Peter tries to restore his normal life, but instead opens the door to the multiverse, bringing in enemies from different dimensions.",
        image: 'spiderman_nwh.jpg',
        pgrating: 'PG-13',
        year: 2021),
    Item(
        name: "Superman Returns",
        production: 'DC Comics',
        rating: 2,
        desc:
            "After being absent for several years, Superman returns to Earth to find a world that no longer needs him. He must confront new realities and threats from Lex Luthor, who has a sinister plan to destroy the world.",
        image: 'superman_returns.jpg',
        pgrating: 'PG-13',
        year: 2006),
    Item(
        name: "The Flash",
        production: 'DC Comics',
        rating: 1,
        desc:
            "Barry Allen uses his powers to travel back in time to prevent his mother's murder. However, his actions create an alternate reality with dangerous consequences that he must face.",
        image: 'theflash.jpg',
        pgrating: 'PG-13',
        year: 2023),
    Item(
        name: "Thor: Love and Thunder",
        production: 'Marvel',
        rating: 4,
        desc:
            "Thor must face Gorr the God Butcher, who aims to exterminate the gods. Aided by Valkyrie, Korg, and his ex-girlfriend Jane Foster, now the Mighty Thor, they strive to stop this threat.",
        image: 'thor_lat.jpg',
        pgrating: 'PG-13',
        year: 2022),
  ];
}
