import 'package:flutter/material.dart';

class Tabbar extends AppBar {
  Tabbar()
      : super(
            elevation: 0.25,
            backgroundColor: Colors.white,
            flexibleSpace: _buildTabbar());

  static Widget _buildTabbar() {
    return new Container(
      padding: EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Scaffold(
        appBar: TabBar(
          tabs: <Widget>[
            Tab(
              text: ("Detail"),
            ),
            Tab(
              text: ("Detail"),
            ),
            Tab(
              text: ("Detail"),
            ),
          ],
        ),
      ),
    );
  }
}
