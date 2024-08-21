import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/room/room.dart';
import 'package:s7_cinema/pages/admin/comp_theater.dart';
import 'package:s7_cinema/repository/room/room_repository.dart';

class TheaterManagementPage extends StatefulWidget {
  const TheaterManagementPage({super.key});

  @override
  State<TheaterManagementPage> createState() => _TheaterManagementPageState();
}

class _TheaterManagementPageState extends State<TheaterManagementPage> {
  int pageIndex = 0;

  final api = ApiRoom.instance.restClient;

  List<RoomResponse> listRoom = [];

  bool isLoading = true;

  @override
  void initState() {
    getLisrTheater();
    super.initState();
  }

  getLisrTheater({bool? isLoadMore = false}) async {
    if (isLoadMore == false) {
      pageIndex = 0;
      listRoom.clear();
    } else {
      pageIndex++;
    }
    try {
      final response = await api.listRoom({
        "page": pageIndex,
        "limit": 10,
      });

      List<RoomResponse> list = response.data['items'].map<RoomResponse>((e) => RoomResponse.fromJson(e)).toList();
      listRoom.addAll(list);
      isLoading = false;
    } catch (error) {
      print(error);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý rạp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CompTheater())).then((value) {
                if (value == true) {
                  getLisrTheater();
                }
              });
            },
          ),
        ],
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
                    itemCount: listRoom.length,
                    itemBuilder: (context, index) => _itemRoom(listRoom[index]),
                  ),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _itemRoom(RoomResponse film) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => CompTheater(id: film.id))).then((value) {
          if (value == true) {
            getLisrTheater();
          }
        });
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
                  film.capacity.toString(),
                  style: const TextStyle(fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
