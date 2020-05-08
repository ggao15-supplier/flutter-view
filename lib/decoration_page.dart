import 'package:flutter/material.dart';

class DecorationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("decoration"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          DecoratedBox(
            child: Padding(
              padding: EdgeInsets.all(50),
              child: Text(
                "aaaaa",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
            ),
            position: DecorationPosition.background,
            decoration: BoxDecoration(
              // color: Colors.green,
              // backgroundBlendMode: BlendMode.overlay,
              border: Border.all(color: Colors.red, width: 4),
              boxShadow: [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(10, 10),
                    blurRadius: 6,
                    spreadRadius: 6)
              ],
              gradient: LinearGradient(colors: [Colors.red, Colors.green]),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              // image: DecorationImage(
              //     image: AssetImage("assets/ic_launcher.png"))
            ),
          )
        ],
      ),
    );
  }
}
