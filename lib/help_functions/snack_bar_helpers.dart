
import 'package:flutter/material.dart';

void showSimpleSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), duration: Duration(milliseconds: 1500),));
}