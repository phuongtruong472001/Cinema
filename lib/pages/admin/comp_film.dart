import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';

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

  @override
  initState() {
    if (widget.id != null) {
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
      setState(() {});
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: nameController,
              ),
              TextFormField(
                controller: durationController,
              ),
              TextFormField(
                controller: durationController,
              ),
              TextFormField(
                controller: descriptionController,
                maxLines: 5,
              ),
              TextFormField(
                controller: trailerController,
              ),
              TextFormField(
                controller: imageController,
              ),
              TextButton(
                onPressed: isEdit ? editFilm : createFilm,
                child: Text(isEdit ? 'Sửa' : 'Thêm'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
