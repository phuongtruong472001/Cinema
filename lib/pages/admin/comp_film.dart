import 'package:flutter/material.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';

class CompFilm extends StatefulWidget {
  const CompFilm({super.key});

  @override
  State<CompFilm> createState() => _CompFilmState();
}

class _CompFilmState extends State<CompFilm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController directorController = TextEditingController();
  TextEditingController actorController = TextEditingController();
  TextEditingController durationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController trailerController = TextEditingController();
  TextEditingController imageController = TextEditingController();

  final api = ApiFilm.instance.restClient;
  bool isEdit = false;

  @override
  initState() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      getFilm();
      isEdit = true;
    }
    super.initState();
  }

  getFilm() async {
    try {
      final response = await api.detailFilm({});
      print(response);
    } catch (error) {
      print(error);
    }
  }

  void editFilm() {}

  void createFilm() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Sửa phim' : 'Thêm phim'),
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
              onPressed: isEdit ? editFilm : createFilm,
              child: Text(isEdit ? 'Sửa' : 'Thêm'),
            ),
          ],
        ),
      ),
    );
  }
}
