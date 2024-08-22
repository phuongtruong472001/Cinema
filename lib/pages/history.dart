// màn lịch sử đặt vé
import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/showtimes/showtimes.dart';
import 'package:s7_cinema/repository/showtimes/showtimes_repository.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int pageIndex = 0;

  final api = ApiShowtimes.instance.restClient;

  List<ShowtimesResponse> listShowtimes = [];

  bool isLoading = true;

  @override
  void initState() {
    getListShowtimes();
    super.initState();
  }

  getListShowtimes({bool? isLoadMore = false}) async {
    if (isLoadMore == false) {
      pageIndex = 0;
      listShowtimes.clear();
    } else {
      pageIndex++;
    }
    try {
      final response = await api.listShowtimes({
        "page": pageIndex,
        "limit": 10,
      });

      List<ShowtimesResponse> list = response.data['items'].map<ShowtimesResponse>((e) => ShowtimesResponse.fromJson(e)).toList();
      listShowtimes.addAll(list);
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
        title: const Text('Lịch sử đặt vé'),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: listShowtimes.length,
              itemBuilder: (context, index) {
                final showtime = listShowtimes[index];
                return Container(
                  margin: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: ListTile(
                    title: Text(showtime.movie ?? ''),
                    subtitle: Text('Phòng ${showtime.room} - ${showtime.startTime}'),
                    trailing: Text('Giá: ${showtime.price}'),
                  ),
                );
              },
            ),
    );
  }
}
