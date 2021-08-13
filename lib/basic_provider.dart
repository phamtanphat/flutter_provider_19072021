import 'package:flutter/material.dart';

class Person {
  late String name;
  late int age;

  Person({required this.name , required this.age});
}

class BasicProviderPage extends StatefulWidget {

  @override
  _BasicProviderPageState createState() => _BasicProviderPageState();
}

class _BasicProviderPageState extends State<BasicProviderPage> {
  var person = Person(name: "Nguyen Van A", age: 10);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Basic Provider"),
      ),
      body: Container(
        child: Center(
          child: Text("Demo"),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {

  final Widget child;

  ParentWidget({required this.child});

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.child,
    );
  }
}

class ChildrenWidget extends StatefulWidget {

  @override
  _ChildrenWidgetState createState() => _ChildrenWidgetState();
}

class _ChildrenWidgetState extends State<ChildrenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Children"),
      ),
    );
  }
}

