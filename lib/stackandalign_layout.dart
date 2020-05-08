import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Positioned"),
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        overflow: Overflow.clip,
        textDirection: TextDirection.ltr,
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 200,
            height: 200,
          ),
          Positioned(
            left: 10,
            width: 300,
            top: 10,
            height: 20,
            child: Container(
              color: Colors.blue,
            ),
          )
        ],
      ),
    );
  }
}

class AlignPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack Positioned"),
      ),
      body: Container(
        color: Colors.red,
        child: Align(
          // alignment: Alignment(2, 1),
          //alignment: Alignment.center,
         // alignment: FractionalOffset.topCenter,
         alignment: FractionalOffset(0.2, 2),
          widthFactor: 1.5,
          heightFactor: 1.5,
          child: Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
