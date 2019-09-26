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

class Promo {
  String image;
  String title;
  String content;
  String button;

  Promo({this.image, this.title, this.content, this.button});
}
