import 'package:flutter/material.dart';

class Tabbar extends AppBar {
  Tabbar({TabController controller})
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
            new Tab(
              text: ("Detail"),
            ),
            new Tab(
              text: ("Detail"),
            ),
            new Tab(
              text: ("Detail"),
            ),
          ],
        ),
      ),
    );
  }
}
