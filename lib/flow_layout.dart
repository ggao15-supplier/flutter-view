import 'package:flutter/material.dart';

class WrapOrFlowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WrapOrFlowState();
  }
}

class WrapOrFlowState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wrap Flow"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Wrap(
            direction: Axis.horizontal,
            runAlignment: WrapAlignment.start,
            runSpacing: 10,
            crossAxisAlignment: WrapCrossAlignment.start,
            spacing: 10,
            alignment: WrapAlignment.end,
            children: <Widget>[
              Chip(
                label: Text("1111111"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("222222"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("333333"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("4444444"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("5555555"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("6666666"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
              Chip(
                label: Text("777777"),
                avatar: CircleAvatar(
                  child: Text("A"),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
          Flow(
            delegate: DemoFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              Container(
                color: Colors.blue,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.green,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.red,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.purple,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.black,
                width: 100,
                height: 100,
              ),
              Container(
                color: Colors.cyan,
                width: 100,
                height: 100,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DemoFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  DemoFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    for (int i = 0; i < context.childCount; i++) {
      var w = x + context.getChildSize(i).width + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0),opacity: 0.1);
        x = margin.left + w;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.bottom;
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0),opacity: 0.1);
        x += margin.left + context.getChildSize(i).width + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    return Size(double.infinity, 500.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
