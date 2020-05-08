import 'package:flutter/material.dart';

class CustomScrollViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CustomScrollState();
  }
}

class CustomScrollState extends State {
  ScrollController _controller = ScrollController(initialScrollOffset: 0);
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      print(_controller.offset);
      if (_controller.offset >= 400) {
        _controller.animateTo(0,
            duration: Duration(seconds: 1), curve: Curves.decelerate);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 250,
          flexibleSpace: FlexibleSpaceBar(
            title: Text("flex"),
            background: Container(color: Colors.cyan),
          ),
        ),
        SliverGrid(
          delegate: SliverChildBuilderDelegate(delegateCreator, childCount: 20),
          gridDelegate:
              SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 120),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(delegateCreator, childCount: 20),
        ),
      ],
    );
  }

  Widget delegateCreator(BuildContext context, int index) {
    return Container(
      alignment: Alignment.center,
      color: Colors.green,
      child: Text(
        "slive_$index ",
        style: TextStyle(decoration: TextDecoration.none),
      ),
    );
  }
}
