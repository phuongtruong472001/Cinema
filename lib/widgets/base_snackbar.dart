import 'package:flutter/material.dart';

SnackBar baseSnackbar({bool? isSuccess = true, String? message}) {
  return SnackBar(
    content: Text(
      message ?? 'Thêm mới thành công',
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: isSuccess == true ? Colors.green : Colors.red,
  );
}
