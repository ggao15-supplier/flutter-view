import 'package:flutter/material.dart';
import 'second_page.dart';
import 'flex_demo.dart';
import 'flow_layout.dart';
import 'stackandalign_layout.dart';
import 'padding_page.dart';
import 'size_page.dart';
import 'decoration_page.dart';
import 'transform_page.dart';
void main(List<String> args) {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "counter1",
      home: new HomePage(),
      theme: ThemeData(),
      routes: {
        "sencond_page": (context) => new SecondPage(),
        "flex_page": (context) => DemoPage(),
        "flow_page": (context) => WrapOrFlowPage(),
        "stack_page": (context) => StackPage(),
        "align_page": (context) => AlignPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State {
  int _count = 0;
  void addCount() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("counter"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("$_count"),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "flex_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("go flex"),
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "flow_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("go flow"),
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "stack_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("go stack"),
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "align_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("go align"),
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "align_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("go align"),
            ),
            FlatButton.icon(
              icon: Icon(Icons.navigate_next),
              label: Text("go padding"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PaddingPage()));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.navigate_next),
              label: Text("go size"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => SizePage()));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.navigate_next),
              label: Text("go decoration"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => DecorationPage()));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.navigate_next),
              label: Text("go transform"),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TransformPage()));
              },
            ),
            FlatButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, "sencond_page");
              },
              icon: new Icon(Icons.next_week),
              label: new Text("next"),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          addCount();
        },
        child: new Icon(Icons.add),
      ),
    );
  }
}
