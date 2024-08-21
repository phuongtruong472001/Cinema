import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:s7_cinema/models/response/film/film.dart';
import 'package:s7_cinema/repository/film/film_repository.dart';
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
              BaseInput(
                controller: nameController,
                label: 'Tên phim',
              ),
              const SizedBox(height: 12),
              BaseInput(
                controller: durationController,
                label: 'Thời lượng',
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              const SizedBox(height: 12),
              BaseInput(
                controller: descriptionController,
                maxLines: 5,
                label: 'Mô tả',
              ),
              const SizedBox(height: 12),
              BaseInput(
                controller: trailerController,
                label: 'Trailer',
              ),
              const SizedBox(height: 12),
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
