import 'package:flutter/material.dart';

SnackBar buildSnackBar(String message, BuildContext context) {
  return SnackBar(
    duration: const Duration(seconds: 3),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20))),
    content: Text(message),
    action: SnackBarAction(
      label: 'Close',
      onPressed: () {
        ScaffoldMessenger.of(context).clearSnackBars();
      },
    ),
  );
}
