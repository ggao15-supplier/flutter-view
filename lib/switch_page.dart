import 'package:flutter/material.dart';
import 'progress_bar.dart';

class SwitchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SwitchState();
  }
}

class SwitchState extends State<SwitchPage> {
  bool _active = false;
  bool _checkBoxSelected = false;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();
  FocusScopeNode _scopeNode;
  GlobalKey _formKey = new GlobalKey<FormState>();
  FocusNode _nameNode = FocusNode(canRequestFocus: true);
  FocusNode _pwdNode = FocusNode(canRequestFocus: true);
  @override
  Widget build(BuildContext context) {
    _scopeNode = FocusScope.of(context);
    _nameNode.addListener(() {
      print("name focus is ${_nameNode.hasFocus}");
    });
    _pwdNode.addListener(() {
      print("pwd focus is ${_pwdNode.hasFocus}");
    });
    _nameController.selection =
        TextSelection(baseOffset: 0, extentOffset: _nameController.text.length);
    return Scaffold(
        appBar: AppBar(
          title: Text("switch page"),
        ),
        body: Theme(
          data: ThemeData(
              hintColor: Colors.blue,
              inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(),
                  hintStyle: TextStyle(),
                  focusColor: Colors.brown,
                  border: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyan, width: 2)))),
          child: Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return ProgressPage();
                  }));
                },
                child: Text("go"),
              ),
              Switch(
                value: _active,
                onChanged: (value) {
                  setState(() {
                    _active = value;
                  });
                },
              ),
              Checkbox(
                value: _checkBoxSelected,
                activeColor: Colors.green,
                onChanged: (value) {
                  setState(() {
                    _checkBoxSelected = value;
                  });
                },
              ),
              Form(
                key: _formKey,
                autovalidate: true,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      controller: _nameController,
                      focusNode: _nameNode,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontStyle: FontStyle.italic),
                          labelText: "name",
                          hintText: "name",
                          hintStyle:
                              TextStyle(color: Colors.blue, fontSize: 20)),
                      textInputAction: TextInputAction.go,
                      obscureText: false,
                      autovalidate: true,
                      style: TextStyle(fontSize: 30, color: Colors.green),
                      validator: (value) {
                        return value.trim().length > 0 ? null : "请输入用户名";
                      },
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                    TextFormField(
                      controller: _pwdController,
                      focusNode: _pwdNode,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                              fontStyle: FontStyle.italic),
                          labelText: "password",
                          hintText: "password",
                          hintStyle:
                              TextStyle(color: Colors.blue, fontSize: 20)),
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      autovalidate: true,
                      style: TextStyle(fontSize: 30, color: Colors.green),
                      validator: (value) {
                        return value.trim().length > 0 ? null : "密码不能少于6位";
                      },
                      onSaved: (value) {
                        print(value);
                      },
                    ),
                  ],
                ),
              ),
              RaisedButton(
                child: Text("submit"),
                onPressed: () {
                  if ((_formKey.currentState as FormState).validate()) {
                    (_formKey.currentState as FormState).save();
                  } else {
                    print("validate error");
                  }
                },
              ),
              RaisedButton(
                onPressed: () {
                  if (_nameNode.hasFocus) {
                    _scopeNode.requestFocus(_pwdNode);
                  } else {
                    _scopeNode.requestFocus(_nameNode);
                  }
                },
                child: Text("move Focus"),
              ),
              RaisedButton(
                onPressed: () {
                  _nameNode.unfocus();
                  _pwdNode.unfocus();
                },
                child: Text("hide Focus"),
              )
            ],
          )),
        ));
  }
}
