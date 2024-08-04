import 'package:flutter/material.dart';
import 'package:katalog_film/models/item.dart';

class MoviesDetail extends StatefulWidget {
  final Item movie;
  const MoviesDetail({required this.movie, super.key});

  @override
  State<MoviesDetail> createState() => _MoviesDetailState();
}

class _MoviesDetailState extends State<MoviesDetail> {
  @override
  Widget build(BuildContext context) {
    Item movie = widget.movie;
    double height = MediaQuery.of(context).size.height;

    @override
    void initState() {
      super.initState();
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.download),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/movie');
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                      size: 35,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    'Detail Film',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                      MediaQuery.of(context).size.width / 20),
                  child: Image.asset(
                    'assets/${movie.image}',
                    width: MediaQuery.of(context).size.width,
                    height: height / 1.5,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: Text(
                            movie.name,
                            overflow: TextOverflow.clip,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 14,
                        color: Colors.yellow,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movie.rating.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.movie,
                        size: 14,
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                      Text(
                        movie.production.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bahasa",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black38)),
                          Text("English",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rating",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black38)),
                          Text("PG-17",
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 16))
                        ],
                      ),
                      const SizedBox(
                        width: 24,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Tahun Rilis",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black38)),
                          Text('2000an',
                              textAlign: TextAlign.justify,
                              style: const TextStyle(fontSize: 16))
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Deskripsi",
                          textAlign: TextAlign.justify,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        movie.desc,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(fontSize: 14),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
