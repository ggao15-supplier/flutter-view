import 'package:flutter/material.dart';

class DemoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DemoState();
  }
}

class DemoState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flex"),
      ),
      body: Container(
        color: Colors.blue,
        child: Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  child: Text("aaa"),
                )),
            Expanded(
    
              child: Container(
                color: Colors.yellow,
                child: Text("bb"),
              ),
              flex: 3,
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: Text("ccc"),
              ),
              flex: 4,
            )
          ],
        ),
      ),
    );
  }
}
