import 'package:flutter/material.dart';

class TapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TapState();
  }
}

class TapState extends State<TapPage> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _handleTap();
      },
      child: new Container(
        child: new Center(
            child: new Text(_active ? "Active" : "Inactive",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    decoration: TextDecoration.none))),
        width: 100,
        height: 100,
        decoration:
            new BoxDecoration(color: _active ? Colors.green : Colors.blueGrey),
      ),
    );
  }
}
