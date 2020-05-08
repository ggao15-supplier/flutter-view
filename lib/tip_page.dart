import 'package:flutter/material.dart';
import 'tap_page.dart';
import 'switch_page.dart';

class TipPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var argument = ModalRoute.of(context).settings.arguments;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("tip"),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(argument),
            Icon(IconData(0xe738,
                fontFamily: 'wechat', matchTextDirection: true)),
            FlatButton.icon(
              onPressed: () {
                Navigator.of(context).pop("from back");
              },
              icon: Icon(Icons.arrow_back_ios),
              label: Text("back"),
            ),
            GestureDetector(
              child: Image(
                image: AssetImage('assets/ic_launcher.png'),
                width: 100,
              ),
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SwitchPage();
                }));
              },
            ),
            Image.asset(
              'assets/ic_launcher.png',
              width: 200,
            ),
            Image(
              image: NetworkImage(
                  "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
              width: 200,
            ),
            Image.network(
              "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
              width: 100,
              color: Colors.green,
              colorBlendMode: BlendMode.lighten,
            ),
            new Builder(builder: (context) {
              return RaisedButton(
                onPressed: () {
                  ScaffoldState _scaffoldState = Scaffold.of(context);
                  _scaffoldState.showSnackBar(SnackBar(
                    content: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("data"),
                          FlatButton.icon(
                              onPressed: () {
                                _scaffoldState.hideCurrentSnackBar();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  return TapPage();
                                }));
                              },
                              icon: Icon(Icons.skip_next),
                              label: Text("next"))
                        ]),
                    duration: Duration(seconds: 2),
                  ));
                },
                child: Text("show snackbar"),
              );
            })
          ],
        ),
      ),
    );
  }
}
