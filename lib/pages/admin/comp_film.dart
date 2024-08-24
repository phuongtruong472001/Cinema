import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/models/response/room/room.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';
import 'package:s7_cinema/repository/room/room_repository.dart';
import 'package:s7_cinema/repository/showtimes/showtimes_repository.dart';
import 'package:s7_cinema/widgets/base_input.dart';
import 'package:s7_cinema/widgets/base_snackbar.dart';

class CompFilm extends StatefulWidget {
  const CompFilm({super.key, this.id});
  final String? id;

  @override
  State<CompFilm> createState() => _CompFilmState();
}

class _CompFilmState extends State<CompFilm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController durationController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();
  TextEditingController trailerController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final api = ApiFilm.instance.restClient;

  bool isEdit = false;

  FilmResponse? film;

  List<DateTime> listTime = [];
  List<DateTime> listSelectedTime = [];

  DateTime selectedDate = DateTime.now();

  List<RoomResponse> listRoom = [];

  RoomResponse? selectedRoom;

  @override
  initState() {
    if (widget.id != null) {
      addTime();
      getRooms();
      getFilm(widget.id!);

      isEdit = true;
    }
    super.initState();
  }

  getFilm(String id) async {
    try {
      film = (await api.detailFilm(id)).data;
      nameController.text = film!.name ?? '';
      durationController.text = film!.duration.toString();
      descriptionController.text = film!.description ?? '';
      trailerController.text = film!.thumbnail ?? '';
      setState(() {});
    } catch (error) {
      print(error);
    }
  }

  getRooms() async {
    final api = ApiRoom.instance.restClient;
    try {
      final response = await api.listRoom({});
      List<RoomResponse> list = response.data['items'].map<RoomResponse>((e) => RoomResponse.fromJson(e)).toList();
      listRoom.addAll(list);
    } catch (error) {
      print(error);
    }
  }

  addTime() {
    // thêm vào danh sách thời gian từ 8h sáng đến 23h tối cách 30 phút
    for (int i = 8; i < 23; i++) {
      listTime.add(DateTime(selectedDate.year, selectedDate.month, selectedDate.day, i, 0));
      listTime.add(DateTime(selectedDate.year, selectedDate.month, selectedDate.day, i, 30));
    }
    setState(() {});
  }

  void editFilm() async {
    try {
      await api.updateFilm(
        {
          "name": nameController.text,
          "duration": int.parse(durationController.text),
          "description": descriptionController.text,
        },
        widget.id!,
      );
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(message: 'Sửa thành công'));
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(isSuccess: false, message: 'Sửa thất bại'));
    }
  }

  addShowtimes() {
    final apiShowtimes = ApiShowtimes.instance.restClient;
    try {
      listSelectedTime.forEach((element) async {
        await apiShowtimes.createShowtimes({
          "movie": film?.id,
          "room": selectedRoom?.id,
          "price": 0,
          "startTime": (element.millisecondsSinceEpoch) / 1000,
        });
      });
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(message: 'Thêm lịch chiếu thành công'));
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(isSuccess: false, message: 'Thêm lịch chiếu thất bại'));
    }
  }

  void createFilm() async {
    try {
      await api.createFilm({
        "name": nameController.text,
        "duration": int.parse(durationController.text),
        "description": descriptionController.text,
        "thumbnail": trailerController.text,
      });
      Navigator.pop(context, true);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(message: 'Thêm thành công'));
    } catch (error) {
      print(error);
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(isSuccess: false, message: 'Thêm thất bại'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Sửa phim' : 'Thêm phim'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: !isEdit
            ? _buildForm()
            : DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    const TabBar(tabs: [
                      Tab(
                        text: 'Thông tin',
                      ),
                      Tab(
                        text: 'Lịch chiếu',
                      ),
                    ]),
                    const SizedBox(height: 20.0),
                    Expanded(
                      child: TabBarView(
                        children: [
                          _buildForm(),
                          _buildShowTime(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildForm() {
    return SingleChildScrollView(
      child: Column(
        children: [
          BaseInput(
            controller: nameController,
            label: 'Tên phim',
            validator: (p0) => p0!.isEmpty ? 'Tên phim không được để trống' : null,
          ),
          const SizedBox(height: 20.0),
          BaseInput(
            controller: durationController,
            label: 'Thời lượng',
            keyboardType: TextInputType.number,
            validator: (p0) => p0!.isEmpty ? 'Thời lượng không được để trống' : null,
          ),
          const SizedBox(height: 20.0),
          BaseInput(
            controller: descriptionController,
            label: 'Mô tả',
            validator: (p0) => p0!.isEmpty ? 'Mô tả không được để trống' : null,
          ),
          const SizedBox(height: 20.0),
          BaseInput(
            controller: trailerController,
            label: 'Trailer',
            validator: (p0) => p0!.isEmpty ? 'Trailer không được để trống' : null,
          ),
          const SizedBox(height: 20.0),
          ElevatedButton(
            onPressed: () {
              if (nameController.text.isEmpty ||
                  durationController.text.isEmpty ||
                  descriptionController.text.isEmpty ||
                  trailerController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(isSuccess: false, message: 'Vui lòng điền đầy đủ thông tin'));
              } else {
                if (isEdit) {
                  editFilm();
                } else {
                  createFilm();
                }
              }
            },
            child: Text(isEdit ? 'Sửa' : 'Thêm'),
          ),
        ],
      ),
    );
  }

  Widget _buildShowTime() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(child: Text('Lịch chiếu')),
          const Text(
            'Select a room',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
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
            child: _room(),
          ),

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
              onDateChange: (selectedDate) {
                //`selectedDate` the new date selected.
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
          // Continue button
          Center(
            child: TextButton(
              onPressed: () {
                addShowtimes();
              },
              child: const Text(
                'Thêm lịch chiếu',
              ),
            ),
          ),
        ],
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
              if (listSelectedTime.contains(listTime[index])) {
                listSelectedTime.remove(listTime[index]);
              } else {
                listSelectedTime.add(listTime[index]);
              }
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: listSelectedTime.contains(listTime[index]) ? Colors.green : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              DateFormat.Hm().format(listTime[index]),
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

  Widget _room() {
    return ListView.builder(
      itemCount: listRoom.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRoom = listRoom[index];
            });
          },
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: selectedRoom == listRoom[index] ? Colors.green : Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              listRoom[index].name ?? '',
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
