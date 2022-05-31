import 'package:flutter/material.dart';

class Data extends InheritedWidget {
  final int counter;
  final Widget child;
  const Data({Key? key, required this.counter, required this.child})
      : super(key: key, child: child);
  static Data? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Data>();
  }

  @override
  bool updateShouldNotify(Data old) => counter != old.counter;
}
