import 'package:flutter/material.dart';
import 'package:s7_cinema/models/response/room/room.dart';
import 'package:s7_cinema/repository/room/room_repository.dart';

const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';

class CompTheater extends StatefulWidget {
  const CompTheater({super.key, this.id});
  final String? id;

  @override
  State<CompTheater> createState() => _CompTheaterState();
}

class _CompTheaterState extends State<CompTheater> {
  TextEditingController nameController = TextEditingController();
  TextEditingController rowController = TextEditingController();
  TextEditingController columnController = TextEditingController();
  int row = 0, col = 0, capacity = 0;
  TextEditingController capacityController = TextEditingController();
  final keyForm = GlobalKey<FormState>();
  List<List<String?>> seats = [[]];

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
      //  seats = room!.seats ?? [[] as List<int>];
      // rowController.text = room!.
    } catch (error) {
      print(error);
    }
  }

  void editTheater() {}

  Future<void> createTheater() async {
    if (keyForm.currentState!.validate()) {
      await api.createRoom({
        'name': nameController.text,
        'capacity': capacity,
        'seats': seats,
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Thêm thành công')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    capacity = countCapacity(seats);
    capacityController.text = capacity.toString();
    return Scaffold(
      appBar: AppBar(
        title: Text(isEdit ? 'Sửa rạp' : 'Thêm rạp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: keyForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("Tên rạp")),
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập tên';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("Số hàng")),
                    controller: rowController,
                    onChanged: (value) {
                      row = int.tryParse(rowController.text) ?? 0;
                      seats = genSeats(row, col);
                      capacity = 0;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số hàng';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("Số cột")),
                    controller: columnController,
                    onChanged: (value) {
                      col = int.tryParse(columnController.text) ?? 0;
                      seats = genSeats(row, col);
                      capacity = 0;
                      setState(() {});
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số cột';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(label: Text("Số ghế")),
                    controller: capacityController,
                    readOnly: true,
                  ),
                ),
                //---------------------------------------------------
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Bố trí chỗ ngồi',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    col + 1,
                    (indexColumn) {
                      return Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: 40,
                        child: Text(
                          indexColumn == 0 ? '' : indexColumn.toString(),
                        ),
                      );
                    },
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: List.generate(
                    row,
                    (indexRow) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            alignment: Alignment.center,
                            child: Text(
                              alphabet[indexRow],
                            ),
                          ),
                          ...List.generate(
                            col,
                            (indexColumn) {
                              return IconButton(
                                onPressed: () {
                                  seats[indexRow][indexColumn] = seats[indexRow][indexColumn] == null ? rowAndColumn2Id(indexRow, indexColumn) : null;
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.chair,
                                  color: seats[indexRow][indexColumn] == null ? Colors.grey : Colors.red,
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 8),
                  color: Colors.blue,
                  child: const Text("Màn chiếu"),
                ),
                //---------------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () async {
                      if (isEdit) {
                        editTheater();
                      } else {
                        await createTheater();
                      }
                      Navigator.pop(context, true);
                    },
                    child: Text(isEdit ? 'Sửa' : 'Thêm'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String rowAndColumn2Id(int row, int col) {
  String alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  return alphabet[row] + col.toString();
}

List<List<String?>> genSeats(int row, int col) {
  return List.generate(row, (r) => List.generate(col, (c) => rowAndColumn2Id(r, c)));
}

int countCapacity(List<List<String?>> seats) {
  int count = 0;
  for (var row in seats) {
    for (var col in row) {
      if (col != null) {
        count++;
      }
    }
  }
  return count;
}
