import 'package:flutter/material.dart';

void showSnackBar(BuildContext context) {
  final snackBar = const SnackBar(
    content: Text('Note Added Successfully'),
    duration: Duration(seconds: 3),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
