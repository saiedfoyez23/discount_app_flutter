import 'package:flutter/material.dart';

class SnackMessage {
  void showSnackbar(context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}