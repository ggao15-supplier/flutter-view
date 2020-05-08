import 'package:flutter/material.dart';

class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, @required Widget child})
      : super(child: child);

  final int data;
  static ShareDataWidget of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(ShareDataWidget);
  }

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
    return Padding(
      child: Text("${ShareDataWidget.of(context).data}"),
      padding: EdgeInsets.all(10),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("Dependencies change");
  }
}

class WillPopPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return WillPopState();
  }
}

class WillPopState extends State {
  DateTime _lastTime;
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("will pop"),
        ),
        body: ShareDataWidget(
          child: Builder(
            builder: (context) {
              return WillPopScope(
                onWillPop: () async {
                  ScaffoldState scaffoldState = Scaffold.of(context);
                  if (_lastTime == null ||
                      DateTime.now().difference(_lastTime).inSeconds > 2) {
                    scaffoldState.showSnackBar(SnackBar(
                      content: Text("再点一次退出"),
                      duration: Duration(seconds: 1),
                    ));
                    _lastTime = DateTime.now();
                    return false;
                  }
                  return true;
                },
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ShowWidget(),
                      RaisedButton.icon(
                        icon: Icon(Icons.ac_unit),
                        label: Text("add"),
                        onPressed: () {
                          setState(() {
                            value++;
                          });
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          ),
          data: value,
        ));
  }
}
