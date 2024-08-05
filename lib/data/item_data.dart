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
            'Ketika musuh tak terduga muncul mengancam keselamatan dunia, Nick Fury, direktur S.H.I.E.L.D., memulai rekrutmen proyek superhero yang dikenal sebagai Avengers. Tim ini terdiri dari Iron Man, Captain America, Thor, Hulk, Black Widow, dan Hawkeye. Mereka harus belajar bekerja sama untuk menghentikan Loki dan pasukannya dari memulai perang global.',
        image: 'avengers.jpg',
        pgrating: 'PG-13',
        year: 2012),
    Item(
        name: "Avengers : Age of Ultron",
        production: 'Marvel',
        rating: 5,
        desc:
            'Avengers berkumpul kembali untuk menghadapi Ultron, sebuah program kecerdasan buatan yang diciptakan oleh Tony Stark dan Bruce Banner. Ultron, yang memiliki rencana jahat untuk menghancurkan umat manusia, harus dihentikan oleh para pahlawan super ini sebelum terlambat.',
        image: 'avengers_aou.jpg',
        pgrating: 'PG-13',
        year: 2015),
    Item(
        name: "Avengers: Infinity War",
        production: 'Marvel',
        rating: 5,
        desc:
            'Avengers dan sekutu mereka bersatu untuk melawan Thanos, tiran antargalaksi yang mengumpulkan Infinity Stones untuk mencapai tujuannya menghapus setengah populasi alam semesta. Pertarungan epik ini menempatkan nasib alam semesta dalam keseimbangan.',
        image: 'infinity_war.jpg',
        pgrating: 'PG-13',
        year: 2018),
    Item(
        name: "Avengers: Endgame",
        production: 'Marvel',
        rating: 5,
        desc:
            'Setelah kehancuran yang disebabkan oleh Thanos di Avengers: Infinity War, para Avengers yang tersisa berusaha untuk membalikkan keadaan dan mengembalikan semua orang yang hilang. Mereka melakukan perjalanan melintasi waktu untuk mengumpulkan Infinity Stones dan mengalahkan Thanos sekali dan untuk selamanya.',
        image: 'endgame.jpg',
        pgrating: 'PG-13',
        year: 2019),
    Item(
        name: "Blue Beetle",
        production: 'DC Comics',
        rating: 3,
        desc:
            'Jaime Reyes, seorang remaja yang menemukan seekor kumbang alien yang memberinya kekuatan super dan baju besi. Dengan kekuatan ini, Jaime harus belajar mengendalikan kekuatannya dan melindungi orang-orang yang dicintainya dari ancaman yang datang.',
        image: 'blue_beetle.jpg',
        pgrating: 'PG-13',
        year: 2023),
    Item(
        name: "The Dark Knight",
        production: 'DC Comics',
        rating: 5,
        desc:
            'Batman menghadapi musuh baru yang kejam dan tak terduga, Joker. Dengan bantuan Komisaris Gordon dan Jaksa Distrik Harvey Dent, Batman berusaha menghentikan Joker yang ingin menghancurkan kota Gotham dan membuktikan bahwa bahkan pahlawan terbesar pun memiliki batas.',
        image: 'dark_knight.jpg',
        pgrating: 'PG-13',
        year: 2008),
    Item(
        name: "Suicide Squad",
        production: 'DC Comics',
        rating: 4,
        desc:
            'Sekelompok penjahat super yang dipenjara diberi kesempatan untuk mengurangi hukuman mereka dengan menjalankan misi berbahaya untuk pemerintah. Dipimpin oleh Deadshot, Harley Quinn, dan Captain Boomerang, mereka harus bekerja sama untuk menghentikan ancaman yang mengancam dunia.',
        image: 'suicide_squad.jpg',
        pgrating: 'PG-13',
        year: 2016),
    Item(
        name: "Batman v Superman: Dawn of Justice",
        production: 'DC Comics',
        rating: 4,
        desc:
            'Film ini mengisahkan tentang konflik antara Batman (Bruce Wayne) dan Superman (Clark Kent) setelah pertarungan Superman yang merusak kota Metropolis. Lex Luthor memanipulasi keduanya agar saling bertarung, sementara ancaman baru muncul dalam bentuk Doomsday.',
        image: 'batmanvsuperman.jpg',
        pgrating: 'PG-13',
        year: 2016),
    Item(
        name: "Black Widow",
        production: 'Marvel',
        rating: 3,
        desc:
            'Natasha Romanoff (Black Widow) berhadapan dengan bagian kelam dari masa lalunya ketika konspirasi berbahaya yang terkait dengan sejarahnya muncul. Dikejar oleh kekuatan yang tak kenal lelah, Natasha harus menghadapi masa lalunya sebagai mata-mata dan hubungan rusak yang ditinggalkannya jauh sebelum menjadi Avenger.',
        image: 'black_widow.jpg',
        pgrating: 'PG-13',
        year: 2021),
    Item(
        name: "Spider-Man: No Way Home",
        production: 'Marvel',
        rating: 5,
        desc:
            'Peter Parker menghadapi tantangan terbesar dalam hidupnya ketika identitasnya sebagai Spider-Man terbongkar. Meminta bantuan Doctor Strange, Peter mencoba untuk mengembalikan kehidupan normalnya, tetapi justru membuka pintu ke multiverse yang membawa musuh-musuh dari berbagai dimensi.',
        image: 'spiderman_nwh.jpg',
        pgrating: 'PG-13',
        year: 2021),
    Item(
        name: "Superman Returns",
        production: 'DC Comics',
        rating: 2,
        desc:
            'Setelah menghilang selama beberapa tahun, Superman kembali ke Bumi untuk menemukan dunia yang tidak lagi membutuhkannya. Dia harus menghadapi kenyataan baru dan ancaman dari Lex Luthor yang memiliki rencana jahat untuk menghancurkan dunia.',
        image: 'superman_returns.jpg',
        pgrating: 'PG-13',
        year: 2006),
    Item(
        name: "The Flash",
        production: 'DC Comics',
        rating: 1,
        desc:
            'Barry Allen menggunakan kekuatannya untuk melakukan perjalanan kembali ke masa lalu dan mencoba untuk mencegah pembunuhan ibunya. Namun, tindakannya ini menciptakan realitas alternatif dengan konsekuensi berbahaya yang harus dihadapinya.',
        image: 'theflash.jpg',
        pgrating: 'PG-13',
        year: 2023),
    Item(
        name: "Thor: Love and Thunder",
        production: 'Marvel',
        rating: 4,
        desc:
            'Thor harus menghadapi Gorr the God Butcher, yang memiliki niat untuk memusnahkan para dewa. Dibantu oleh Valkyrie, Korg, dan mantan kekasihnya Jane Foster yang kini menjadi Mighty Thor, mereka berusaha menghentikan ancaman tersebut.',
        image: 'thor_lat.jpg',
        pgrating: 'PG-13',
        year: 2022),
  ];
}
