import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/pages/admin/comp_film.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';

class MovieManagementPage extends StatefulWidget {
  const MovieManagementPage({super.key});

  @override
  State<MovieManagementPage> createState() => _MovieManagementPageState();
}

class _MovieManagementPageState extends State<MovieManagementPage> {
  int pageIndex = 0;

  final api = ApiFilm.instance.restClient;

  List<FilmResponse> listFilm = [];

  bool isLoading = true;

  @override
  void initState() {
    getListFilm();
    super.initState();
  }

  getListFilm({bool? isLoadMore = false}) async {
    if (isLoadMore == false) {
      pageIndex = 0;
      listFilm.clear();
    } else {
      pageIndex++;
    }
    try {
      final response = await api.listFilm({
        "page": pageIndex,
        "limit": 10,
      });

      List<FilmResponse> list = response.data['items'].map<FilmResponse>((e) => FilmResponse.fromJson(e)).toList();
      listFilm.addAll(list);
      isLoading = false;
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý phim'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Tìm kiếm',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 8),
          isLoading == false
              ? Expanded(
                  child: ListView.builder(
                    itemCount: listFilm.length,
                    itemBuilder: (context, index) => _itemFilm(listFilm[index]),
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _itemFilm(FilmResponse film) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompFilm(id: film.id)));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        child: Row(children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage('https://picsum.photos/200/300'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  film.name ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
                Text(
                  film.description ?? '',
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Text('Thời lượng: ${film.duration ?? ''} phút'),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
