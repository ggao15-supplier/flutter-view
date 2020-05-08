import 'package:flutter/material.dart';

class ProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProgressState();
  }
}

class ProgressState extends State with SingleTickerProviderStateMixin {
  AnimationController _controller;
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("progress bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            LinearProgressIndicator(
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation(Colors.green),
            ),
            Padding(
                padding: EdgeInsets.only(top: 10),
                child: LinearProgressIndicator(
                  value: 0.4,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  value: 0.5,
                  strokeWidth: 4,
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation(Colors.green),
                )),
            Padding(
                padding: EdgeInsets.only(top: 20),
                child: CircularProgressIndicator(
                  value: _controller.value,
                  backgroundColor: Colors.grey,
                  valueColor: ColorTween(begin: Colors.red, end: Colors.green)
                      .animate(_controller),
                ))
          ],
        ),
      ),
    );
  }
}
