import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TransformState();
  }
}

class TransformState extends State with SingleTickerProviderStateMixin {
      var _words = <String>[];
     static const str = "a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,";

  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    var _controller = TabController(length: 3, vsync: this);
    return Scaffold(
        appBar: AppBar(
          title: Text("Transform"),
          centerTitle: false,
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.shop),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: <Widget>[
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    ScaffoldState _state = Scaffold.of(context);
                    _state.showSnackBar(SnackBar(
                      content: Text("share"),
                      duration: Duration(seconds: 2),
                    ));
                  },
                );
              },
            ),
            Builder(
              builder: (context) {
                return IconButton(
                  icon: Icon(Icons.share),
                  onPressed: () {
                    ScaffoldState _state = Scaffold.of(context);
                    _state.showSnackBar(SnackBar(
                      content: Text("share"),
                      duration: Duration(seconds: 2),
                    ));
                  },
                );
              },
            )
          ],
          bottom: TabBar(
            controller: _controller,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: <Tab>[
              Tab(
                icon: Icon(Icons.hot_tub),
                text: "aaa",
              ),
              Tab(
                icon: Icon(Icons.hotel),
                text: "bbb",
              ),
              Tab(
                icon: Icon(Icons.hourglass_full),
                text: "ccc",
              ),
            ],
          ),
        ),
        drawer: Drawer(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: 30),
              child: Row(
                children: <Widget>[
                  ClipOval(
                      child: Container(
                    color: Colors.red,
                    child: Image.asset(
                      "assets/ic_launcher.png",
                      width: 80,
                    ),
                  )),
                  Text("Launcher")
                ],
              ),
            ),
            Expanded(
                child: ListView(
              padding: const EdgeInsets.all(20),
              children: <Widget>[
                Row(
                  children: <Widget>[
                    ClipRect(
                      child: Container(
                        width: 80,
                        color: Colors.blue,
                        child: Icon(Icons.add_a_photo),
                      ),
                    ),
                    Text("add_a_photo")
                  ],
                ),
                Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Container(
                        width: 80,
                        color: Colors.blue,
                        child: Icon(Icons.add_a_photo),
                      ),
                    ),
                    Text("add_a_photo")
                  ],
                )
              ],
            ))
          ],
        )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {},
              ),
              SizedBox(),
              IconButton(
                icon: Icon(Icons.dashboard),
                onPressed: () {},
              )
            ],
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              reverse: true,
              padding: EdgeInsets.all(10),
              physics: AlwaysScrollableScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.blue,
                      child: Transform(
                        alignment: Alignment.topRight,
                        transform: Matrix4.skew(0.3, 0.3),
                        child: Container(
                          color: Colors.red,
                          padding: EdgeInsets.all(10),
                          child: Text("skew(4,5)"),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
                      color: Colors.red,
                      child: Transform.translate(
                        offset: Offset(19, 4),
                        child: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "translate",
                            style:
                                TextStyle(fontSize: 40, color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      color: Colors.red,
                      child: Transform.scale(
                        scale: 1.5,
                        child: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "scale",
                            style:
                                TextStyle(fontSize: 40, color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      color: Colors.red,
                      child: Transform.rotate(
                        angle: math.pi / 4,
                        child: Container(
                          color: Colors.blue,
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "rotate",
                            style:
                                TextStyle(fontSize: 40, color: Colors.yellow),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      color: Colors.red,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Container(
                            color: Colors.blue,
                            padding: EdgeInsets.all(10),
                            child: Text(
                              "rotate",
                              style:
                                  TextStyle(fontSize: 40, color: Colors.yellow),
                            )),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Center(
                child: Scrollbar(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: str.split(",").map((f) {
                        return Text(
                          f,
                          textScaleFactor: 2.0,
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ),
            ListView.separated(
              itemCount: 10,
              addRepaintBoundaries: true,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Container(
                    alignment: Alignment.center,
                    child: Text("$index"),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.red,
                  height: 2,
                );
              },
            )
          ],
        ));
  }

  _retrieveData() {
    Future.delayed(new Duration(seconds: 2)).then((onValue) {
       setState(() {
          _words.insertAll(_words.length-1, str.split(","));
    });
    });
   
  }
}
