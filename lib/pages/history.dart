// màn lịch sử đặt vé
import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/ticket/ticket.dart';
import 'package:s7_cinema/repository/ticket/ticket_repository.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  int pageIndex = 0;

  final api = ApiTicket.instance.restClient;

  List<TicketResponse> listTicket = [];

  bool isLoading = true;

  @override
  void initState() {
    getListTicket();
    super.initState();
  }

  getListTicket({bool? isLoadMore = false}) async {
    if (isLoadMore == false) {
      pageIndex = 0;
      listTicket.clear();
    } else {
      pageIndex++;
    }
    try {
      final response = await api.listTicket({
        "page": pageIndex,
        "limit": 10,
      });

      List<TicketResponse> list = response.data['items'].map<TicketResponse>((e) => TicketResponse.fromJson(e)).toList();
      listTicket.addAll(list);
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
              itemCount: listTicket.length,
              itemBuilder: (context, index) {
                final showtime = listTicket[index];
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
