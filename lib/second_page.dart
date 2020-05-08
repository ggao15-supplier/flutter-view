import 'package:flutter/material.dart';
import 'package:flutter_review/scroll_progress.dart';
import 'tip_page.dart';
import 'grid_view_page.dart';
import 'custom_scroll_view_page.dart';
import 'will_pop_share_data.dart';
import 'share_data.dart';
import 'provider_page.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("second"),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text("second"),
            FlatButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("go grid"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return GridPage();
                }));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.notifications_active),
              label: Text("go scroll progress"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ScrollProgressPage();
                }));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.notifications_active),
              label: Text("go will pop"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return WillPopPage();
                }));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.notifications_active),
              label: Text("go show data"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return AddCountPage();
                }));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("go custom scroll"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return CustomScrollViewPage();
                }));
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.ac_unit),
              label: Text("go provider"),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProviderPage();
                }));
              },
            ),
            new FlatButton(
              onPressed: () async {
                var result = await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return new TipPage();
                    },
                    settings: new RouteSettings(arguments: "from second")));
                print("back is $result");
              },
              child: new Text("go next"),
            )
          ],
        ),
      ),
    );
  }
}
