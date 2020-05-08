import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SizePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("size"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ConstrainedBox(
            child: Container(
              width: 1,
              height: 31,
              color: Colors.red,
            ),
            constraints: BoxConstraints(
                minHeight: 20,
                minWidth: 20,
                maxHeight: double.infinity,
                maxWidth: double.infinity),
          ),
          ConstrainedBox(
            constraints: BoxConstraints.loose(Size(30, 30)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 40,
            width: 40,
            child: Container(
              color: Colors.blue,
              width: 20,
              height: 20,
            ),
          ),
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 120, minWidth: 120),
            child: UnconstrainedBox(
              child: Container(
                width: 10,
                height: 10,
                constraints: BoxConstraints(minWidth: 100, minHeight: 100),
                color: Colors.green,
              ),
            ),
          )
        ],
      ),
    );
  }
}
