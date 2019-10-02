import 'package:flutter/material.dart';

class TravelAppBar extends AppBar {
  TravelAppBar()
      : super(
            elevation: 0.25,
            backgroundColor: Colors.white,
            flexibleSpace: _buildTravelAppBar());

  static Widget _buildTravelAppBar() {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Image.asset(
            "assets/iii.png",
            height: 50.0,
            width: 100.0,
          ),
        ],
      ),
    );
  }
}
