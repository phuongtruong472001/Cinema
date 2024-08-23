import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
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
  bool isLoading = true;

  final api = ApiShowtimes.instance.restClient;

  @override
  void initState() {
    getListTime();
    super.initState();
  }

  void getListTime() async {
    try {
      List<ShowtimesResponse> list =
          (await api.listShowtimes({})).data['items'].map<ShowtimesResponse>((e) => ShowtimesResponse.fromJson(e)).toList();

      listTime.addAll(list);
      isLoading = false;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //Date Title
                  const Text(
                    'Select a date',
                  ),

                  const SizedBox(height: 15),

                  //Dates list
                  EasyDateTimeLine(
                    initialDate: DateTime.now(),
                    onDateChange: (selectedDate) {
                      //`selectedDate` the new date selected.
                    },
                  ),

                  //Time Title
                  const Text(
                    'Select a time',
                  ),

                  const SizedBox(height: 15),

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
        ]),
      ),
    );
  }

  Widget _showTimesList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.only(right: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            '12:00 PM',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        );
      },
    );
  }
}
