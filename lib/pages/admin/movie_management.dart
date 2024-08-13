import 'package:flutter/material.dart';

class MovieManagementPage extends StatefulWidget {
  const MovieManagementPage({super.key});

  @override
  State<MovieManagementPage> createState() => _MovieManagementPageState();
}

class _MovieManagementPageState extends State<MovieManagementPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quản lý phim'),
      ),
      body: Column(
        children: [
          const Text('Movie Management'),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Tìm kiếm',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => _itemFilm(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _itemFilm() {
    return Container(
      child: Row(children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: const DecorationImage(
              image: NetworkImage('https://picsum.photos/200/300'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: Column(
            children: [
              Text('Tên phim'),
              Text('Thể loại'),
              Text('Đạo diễn'),
              Text('Diễn viên'),
              Text('Thời lượng'),
              Text('Ngày khởi chiếu'),
            ],
          ),
        ),
        const SizedBox(width: 8),
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
      ]),
    );
  }
}
