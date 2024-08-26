import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/repository/showtimes/showtimes_repository.dart';

import '../models/response/showtimes/showtimes.dart';

class SelectTimePage extends StatefulWidget {
  const SelectTimePage({super.key, required this.movie});
  final FilmResponse movie;

  @override
  State<SelectTimePage> createState() => _SelectTimePageState();
}

class _SelectTimePageState extends State<SelectTimePage> {
  List<ShowtimesResponse> listTime = [];
  ShowtimesResponse? selectedTime;
  bool isLoading = true;

  final api = ApiShowtimes.instance.restClient;

  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    getListTime();
    super.initState();
  }

  void getListTime() async {
    listTime.clear();
    try {
      List<ShowtimesResponse> list = (await api.listShowtimes({
        'from': selectedDate.millisecondsSinceEpoch ~/ 1000,
        'to': DateTime(selectedDate.year, selectedDate.month, selectedDate.day, 23, 59).millisecondsSinceEpoch ~/ 1000,
      }))
          .data['items']
          .map<ShowtimesResponse>((e) => ShowtimesResponse.fromJson(e))
          .toList();

      listTime.addAll(list);
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
        title: const Text('Select Time'),
      ),
      body: SafeArea(
        child: Column(children: [
          const SizedBox(height: 42),

          //Show details
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 550),
              switchOutCurve: Curves.easeInBack,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Date Title
                    const Text(
                      'Select a date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 15),

                    //Dates list
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: EasyDateTimeLine(
                        initialDate: DateTime.now(),
                        activeColor: Colors.green,
                        onDateChange: (date) {
                          selectedDate = date;
                          selectedTime = null;
                          getListTime();
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    //Time Title
                    const Text(
                      'Select a time',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    //Show times list
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 85,
                      margin: const EdgeInsets.only(right: 20),
                      padding: const EdgeInsets.fromLTRB(0, 20, 20, 20),
                      child: _showTimesList(),
                    ),

                    //Continue button
                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'book', arguments: widget.movie);
                        },
                        child: const Text(
                          'CONTINUE',
                        ),
                      ),
                    ),

                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _showTimesList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: listTime.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedTime = listTime[index];
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedTime == listTime[index] ? Colors.green : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              DateFormat.Hm().format(DateTime.fromMillisecondsSinceEpoch((listTime[index].startTime ?? 0) * 1000)),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      },
    );
  }
}
