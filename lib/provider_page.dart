import 'dart:collection';
import 'dart:developer';
import 'package:flutter/material.dart';

Type _typeOf<T>() {
  return T;
}

class ProviderWidget<T> extends InheritedWidget {
  ProviderWidget({@required this.data, @required Widget child})
      : super(child: child);

  final T data;

  @override
  bool updateShouldNotify(ProviderWidget oldWidget) {
    return data == oldWidget.data;
  }
}

class ChangeNotifierProvider<T extends ChangeNotifier> extends StatefulWidget {
  ChangeNotifierProvider({Key key, @required this.data, @required this.child});
  final Widget child;
  final T data;

  static T of<T>(BuildContext context) {
    final Type providerType = _typeOf<ProviderWidget<T>>();
    final ProviderWidget provider =
        context.inheritFromWidgetOfExactType(providerType) as ProviderWidget<T>;
    return provider.data;
  }

  @override
  State<StatefulWidget> createState() {
    return ChangeNotifierState();
  }
}

class ChangeNotifierState<T extends ChangeNotifier>
    extends State<ChangeNotifierProvider> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      data: widget.data,
      child: widget.child,
    );
  }

  void update() {
    print("aaa ${widget.data}");
    setState(() {});
  }

  @override
  void didUpdateWidget(ChangeNotifierProvider<ChangeNotifier> oldWidget) {
    print("didUpdateWidget");
    if (widget.data != oldWidget.data) {
      oldWidget.data.removeListener(update);
      widget.data.addListener(update);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    debugger();
    widget.data.addListener(update);
    super.initState();
  }

  @override
  void dispose() {
    debugger();
    widget.data.removeListener(update);
    super.dispose();
  }
}

class ProviderPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ProviderState();
  }
}

class ProviderState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CarModel>(
      data: CarModel(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Provider"),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                print("click");
                ChangeNotifierProvider.of<CarModel>(context)
                    .addItem(Item("11", 20, 10));
              },
            ),
            body: Center(
              child: Text(
                  "total price is ${ChangeNotifierProvider.of<CarModel>(context).totalPrice}"),
            ),
          );
        },
      ),
    );
  }
}

class Item {
  Item(this.name, this.price, this.count);
  int count;
  double price;
  String name;
}

class CarModel extends ChangeNotifier {
  final List<Item> _items = [];
  UnmodifiableListView<Item> get item {
    return UnmodifiableListView(_items);
  }

  double _plus(double pre, Item item) {
    return pre + item.count * item.price;
  }

  double get totalPrice {
    return _items.fold(0.0, _plus);
  }

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }
}
