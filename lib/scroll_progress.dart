import 'package:flutter/material.dart';

class ScrollProgressPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ScrollProgressState();
  }
}

class ScrollProgressState extends State {
  var _data = <String>[];
  var _controller = TrackingScrollController();
  var _progress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {});
    for (int i = 0; i < 100; i++) {
      _data.add("${String.fromCharCode(i)}---$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("current is ${(_progress * 100).toInt()}%"),
        ),
        body: NotificationListener(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels /
                notification.metrics.maxScrollExtent;
            setState(() {
              _progress = (progress);
            });
            return true;
          },
          child: Stack(
            alignment: Alignment.topCenter,
            children: <Widget>[
              ListView.separated(
                controller: _controller,
                itemBuilder: itemCreator,
                separatorBuilder: diverCreator,
                itemCount: _data.length,
              ),
              LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.red),
              )
            ],
          ),
        ));
  }

  Widget itemCreator(BuildContext context, int index) {
    return ListTile(
      title: Text(_data[index]),
    );
  }

  Widget diverCreator(BuildContext context, int index) {
    return Divider(
      color: Colors.red,
      height: 2,
    );
  }
}
