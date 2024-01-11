// import 'package:flutter/material.dart';

// class CounterState {
//   int _value = 0;
//   void inc() => _value++;
//   void dec() => _value--;
//   int get value => _value;
// }

// class CounterProvider extends InheritedWidget {

//   CounterProvider({
//     super.key, 
//     required super.child
//   });
//   final CounterState state = CounterState();
//   // CounterProvider({required Widget child}) : super(child: child);

//   static CounterProvider? maybeOf(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<CounterProvider>();
//   }

//   @override
//   bool updateShoudNotify(InheritedWidget oldWidget) {
//     return true;
//   }
// }
