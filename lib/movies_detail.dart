import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gal/gal.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:katalog_film/models/item.dart';
import 'package:path_provider/path_provider.dart';

class MoviesDetail extends StatefulWidget {
  final Item movie;
  const MoviesDetail({required this.movie, super.key});

  @override
  State<MoviesDetail> createState() => _MoviesDetailState();
}

class _MoviesDetailState extends State<MoviesDetail> {
  final navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    Item movie = widget.movie;
    double height = MediaQuery.of(context).size.height;

    @override
    void initState() {
      super.initState();
    }

    Future<String> getFilePath(String path) async {
      final byteData = await rootBundle.load(path);
      final file = await File(
              '${Directory.systemTemp.path}${path.replaceAll('assets', '')}')
          .create();
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      return file.path;
    }

    Future<void> _saveImage(BuildContext context, String imagePath) async {
      final path = await getFilePath(imagePath);
      await Gal.putImage(path);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text('Poster telah tersimpan di galeri'),
      ));
    }

    void _showDownloadConfirmationDialog() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            title: Text(
              'Download Poster',
              style: TextStyle(color: Colors.white),
            ),
            content: Text(
              'Are you sure you want to download ${movie.name} poster?',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text(
                  'Yes',
                  style: TextStyle(color: Colors.green),
                ),
                onPressed: () {
                  _saveImage(context, 'assets/${movie.image}');
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showDownloadConfirmationDialog();
        },
        child: Icon(Icons.download, size: 35, color: Colors.blue),
        backgroundColor: Color.fromARGB(255, 131, 174, 248),
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
                          Text("PG Rating",
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black38)),
                          Text(movie.pgrating,
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
                          Text(movie.year.toString(),
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
