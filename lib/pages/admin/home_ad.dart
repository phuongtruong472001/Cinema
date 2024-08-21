import 'package:flutter/material.dart';

class HomeAd extends StatefulWidget {
  const HomeAd({super.key});

  @override
  State<HomeAd> createState() => _HomeAdState();
}

class _HomeAdState extends State<HomeAd> {
  final Map<String, String> _items = {
    'Quản lý phim': 'movie_management',
    'Quản lý rạp': 'theater',
    'Quản lý lịch chiếu': 'schedule',
    'Quản lý người dùng': 'user',
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.5),
            itemCount: _items.length,
            itemBuilder: (context, index) => _itemCard(context, index),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
          )
        ],
      ),
    );
  }

  Widget _itemCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, _items.values.elementAt(index));
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: const DecorationImage(
                  image: NetworkImage('https://picsum.photos/200/300'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(_items.keys.elementAt(index)),
          ],
        ),
      ),
    );
  }
}
