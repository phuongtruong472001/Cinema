import 'package:flutter/material.dart';
import 'package:s7_cinema/repository/theater/theather_repository.dart';

class CompTheater extends StatefulWidget {
  const CompTheater({super.key});

  @override
  State<CompTheater> createState() => _CompTheaterState();
}

class _CompTheaterState extends State<CompTheater> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController actorController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController trailerController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final api = ApiTheater.instance.restClient;
  bool isEdit = false;

  @override
  initState() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      getTheater();
      isEdit = true;
    }
    super.initState();
  }

  getTheater() async {
    try {
      final response = await api.detailTheater({});
      print(response);
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
            TextField(
              controller: categoryController,
            ),
            TextField(
              controller: directorController,
            ),
            TextField(
              controller: actorController,
            ),
            TextField(
              controller: durationController,
            ),
            TextField(
              controller: descriptionController,
              maxLength: 5,
            ),
            TextField(
              controller: trailerController,
            ),
            TextField(
              controller: imageController,
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
