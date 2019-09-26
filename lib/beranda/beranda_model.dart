import 'package:flutter/material.dart';

class TravelService {
  IconData image;
  Color color;
  String title;

  TravelService({this.image, this.title, this.color});
}

class Travel {
  String title;
  String image;
  Travel({this.title, this.image});
}

class Destinasi {
  String image;
  String title;
  String content;
  String button;

  Destinasi({this.image, this.title, this.content, this.button});
}
