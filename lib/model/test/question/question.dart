import 'package:flutter/material.dart';

abstract class Question {
  final String id;
  final String type;
  final String text;
  final int order;

  Question(this.id, this.type, this.text, this.order);

  Widget render();
}