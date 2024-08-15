import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/room/room.dart';
import 'package:s7_cinema/repository/room/room_repository.dart';

class CompTheater extends StatefulWidget {
  const CompTheater({super.key, this.id});
  final String? id;

  @override
  State<CompTheater> createState() => _CompTheaterState();
}

class _CompTheaterState extends State<CompTheater> {
  TextEditingController nameController = TextEditingController();

  final api = ApiRoom.instance.restClient;
  bool isEdit = false;

  RoomResponse? room;

  @override
  initState() {
    if (widget.id != null) {
      getTheater(widget.id!);
      isEdit = true;
    }
    super.initState();
  }

  getTheater(String id) async {
    try {
      room = (await api.detailRoom(id)).data;
      nameController.text = room!.name ?? '';
    } catch (error) {
      print(error);
    }
  }

  void editTheater() {}

  void createTheater() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Sửa rạp' : 'Thêm rạp'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
            ),
            TextButton(
              onPressed: isEdit ? editTheater : createTheater,
              child: Text(isEdit ? 'Sửa' : 'Thêm'),
            ),
          ],
        ),
      ),
    );
  }
}
