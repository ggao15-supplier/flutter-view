import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, @required Widget child})
      : super(child: child);

  static ShareDataWidget of(BuildContext context) {
    return context
        .ancestorInheritedElementForWidgetOfExactType(ShareDataWidget)
        .widget;
  }

 final int data;

  @override
  bool updateShouldNotify(ShareDataWidget oldWidget) {
    return data != oldWidget.data;
  }
}

class ShowWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ShowState();
  }
}

class ShowState extends State {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("${ShareDataWidget.of(context).data}"),
    );
  }
}

class AddCountPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddCountState();
  }
}

class AddCountState extends State {
  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          data: _value,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                child: ShowWidget(),
                padding: EdgeInsets.all(10),
              ),
              Padding(
                child: RaisedButton.icon(
                  icon: Icon(Icons.add),
                  label: Text("add"),
                  onPressed: () {
                    setState(() {
                      _value++;
                    });
                  },
                ),
                padding: EdgeInsets.all(10),
              )
            ],
          )),
    );
  }
}
