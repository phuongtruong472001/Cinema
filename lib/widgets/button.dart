import 'package:flutter/material.dart';

class BaseButton extends OutlinedButton {
  BaseButton({
    Key? key,
    required VoidCallback onPressed,
    required String text,
    bool isPrimary = false,
  }) : super(
          key: key,
          onPressed: onPressed,
          child: Text(
            text,
            style: TextStyle(
              color: isPrimary ? Colors.white : Colors.black,
            ),
          ),
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all<Size>(
              const Size(double.infinity, 50),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              isPrimary ? Colors.black : Colors.white,
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        );
}
