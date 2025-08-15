
  import 'package:flutter/material.dart';

SnackBar buildErrorSnacBar(String errorMessage) {
    return SnackBar(
  content: Text(
    errorMessage,
    style: TextStyle(color: Colors.white),
  ),
  backgroundColor: Colors.red,
  duration: Duration(seconds: 3),
);
  }