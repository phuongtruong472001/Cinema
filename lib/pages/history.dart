// màn lịch sử đặt vé
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

      List<TicketResponse> list = response.data.map<TicketResponse>((e) => TicketResponse.fromJson(e)).toList();
      listTicket.addAll(list);
    } catch (error) {
      print(error);
    }
    isLoading = false;
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
                final ticket = listTicket[index];
                DateTime date = DateTime.fromMillisecondsSinceEpoch((ticket.showtime?.startTime ?? 0) * 1000);
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    isThreeLine: true,
                    title: Text(ticket.showtime?.movie?.name ?? ''),
                    subtitle: Text('Phòng ${ticket.showtime?.room?.name} - Ghế: ${ticket.seat}'),
                    trailing: Text('${DateFormat.Hm().format(date)} - ${DateFormat.yMd().format(date)}'),
                  ),
                );
              },
            ),
    );
  }
}
