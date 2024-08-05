import 'package:flutter/material.dart';
import 'package:katalog_film/data/item_data.dart';
import 'package:katalog_film/data/login_data.dart';
import 'package:katalog_film/models/item.dart';
import 'package:katalog_film/movies_detail.dart';
import 'package:katalog_film/widgets/bottomnavbar.dart';

class Movies extends StatefulWidget {
  Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  String query = '';
  late String username;
  late String password;
  bool marvelFilter = false;
  bool dcComicsFilter = false;

  List<Item> filteredItems = [];

  @override
  void initState() {
    super.initState();
    filteredItems = MoviesData().items;
  }

  void search(String newQuery) {
    setState(() {
      query = newQuery;

      filteredItems = MoviesData().items.where((element) {
        final matchesQuery =
            element.name.toLowerCase().contains(query.toLowerCase());
        final matchesProduction = (!marvelFilter && !dcComicsFilter) ||
            (marvelFilter && element.production == 'Marvel') ||
            (dcComicsFilter && element.production == 'DC Comics');

        return matchesQuery && matchesProduction;
      }).toList();
    });
  }

  void toggleMarvelFilter(bool? value) {
    setState(() {
      marvelFilter = value ?? false;
      search(query);
    });
  }

  void toggleDcComicsFilter(bool? value) {
    setState(() {
      dcComicsFilter = value ?? false;
      search(query);
    });
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text(
            'Hapus Film',
            style: TextStyle(color: Colors.white),
          ),
          content: Text(
            'Apakah anda yakin ingin menghapus film "${filteredItems[index].name}"?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              child: Text(
                'Tidak',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(
                'Ya',
                style: TextStyle(color: Colors.green),
              ),
              onPressed: () {
                setState(() {
                  Item removedItem = filteredItems[index];
                  MoviesData().items.remove(removedItem);
                  search(query);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String? username = LoginData().getUsername();
    String? password = LoginData().getPassword();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your logic here
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 35,
        ),
        backgroundColor: Colors.black,
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    'Hi, $username',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                  child: Image.asset(
                    'assets/default_profile_icon.png',
                    width: 50,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                hintText: 'Cari...',
                hintStyle: TextStyle(color: Colors.grey),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: marvelFilter,
                onChanged: toggleMarvelFilter,
              ),
              Text('Marvel'),
              Checkbox(
                value: dcComicsFilter,
                onChanged: toggleDcComicsFilter,
              ),
              Text('DC Comics'),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: filteredItems.isEmpty && query.isNotEmpty
                  ? const Center(
                      child: Text('Tidak ditemukan hasil',
                          style: TextStyle(fontSize: 20)),
                    )
                  : ListView.builder(
                      itemCount: filteredItems.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => MoviesDetail(
                                        movie: filteredItems[index])));
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 24),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    'assets/${filteredItems[index].image}',
                                    width:
                                        MediaQuery.of(context).size.width * .30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 16,
                                ),
                                Flexible(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Text(
                                        filteredItems[index].name,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          size: 18,
                                          color: Colors.yellow,
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(right: 4.0),
                                          child: Text(
                                            "${filteredItems[index].rating}",
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.movie_creation,
                                          size: 18,
                                          color: Colors.black,
                                        ),
                                        SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${filteredItems[index].production}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 18),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 16,
                                    ),
                                    Container(
                                      padding:
                                          const EdgeInsets.only(right: 4.0),
                                      child: Text(
                                        filteredItems[index].desc,
                                        overflow: TextOverflow.clip,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.edit,
                                            color: Colors.blue,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            // Add your edit logic here
                                          },
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 30,
                                          ),
                                          onPressed: () {
                                            _showDeleteConfirmationDialog(
                                                index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          ),
                        );
                      }),
            ),
          ),
        ],
      )),
      bottomNavigationBar: BottomNavBar(selectedItem: 0),
    );
  }
}
