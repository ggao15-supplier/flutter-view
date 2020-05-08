import 'package:flutter/material.dart';

class GridPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridState();
  }
}

class GridState extends State with SingleTickerProviderStateMixin {
  var _grids = [
    Icon(Icons.ac_unit),
    Icon(Icons.access_alarm),
    Icon(Icons.access_alarms),
    Icon(Icons.access_time),
    Icon(Icons.accessibility),
    Icon(Icons.accessibility_new),
  ];
  var _tabs = <Tab>[
    Tab(
      icon: Icon(Icons.access_alarm),
      text: "normal",
    ),
    Tab(
      icon: Icon(Icons.access_alarms),
      text: "count",
    ),
    Tab(
      icon: Icon(Icons.access_time),
      text: "builder",
    ),
    Tab(
      icon: Icon(Icons.accessibility),
      text: "extent",
    )
  ];
  @override
  Widget build(BuildContext context) {
    var _tabController = TabController(length: _tabs.length, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: Text("grid"),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Container(
            child: GridView(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 100,
                childAspectRatio: 2,
              ),
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.access_alarm),
                Icon(Icons.access_alarms),
                Icon(Icons.access_time),
                Icon(Icons.accessibility),
                Icon(Icons.accessibility_new),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              crossAxisCount: 3,
              children: <Widget>[
                Icon(Icons.ac_unit),
                Icon(Icons.access_alarm),
                Icon(Icons.access_alarms),
                Icon(Icons.access_time),
                Icon(Icons.accessibility),
                Icon(Icons.accessibility_new),
              ],
            ),
          ),
          Container(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 2,
              ),
              itemCount: _grids.length,
              itemBuilder: itemBuilderCreator,
            ),
          ),
          Container(
              child: GridView.extent(
            maxCrossAxisExtent: 120,
            childAspectRatio: 2,
            children: <Widget>[
              Icon(Icons.ac_unit),
              Icon(Icons.access_alarm),
              Icon(Icons.access_alarms),
              Icon(Icons.access_time),
              Icon(Icons.accessibility),
              Icon(Icons.accessibility_new),
            ],
          )),
        ],
      ),
    );
  }

  Widget itemBuilderCreator(BuildContext context, int index) {
    return _grids[index];
  }
}
