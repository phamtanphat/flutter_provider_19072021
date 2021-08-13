import 'package:flutter/material.dart';

class Person {
  late ValueNotifier<String> name;
  late ValueNotifier<int> age;
  Person({required this.name , required this.age});
}

class DemoListenableProviderPage extends StatefulWidget {

  @override
  _DemoListenableProviderPageState createState() => _DemoListenableProviderPageState();
}

class _DemoListenableProviderPageState extends State<DemoListenableProviderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Listenable Provider"),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 20),
              ParentWidget(),
              SizedBox(height: 20),
              OtherWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class ParentWidget extends StatefulWidget {

  @override
  _ParentWidgetState createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Parent"),
      ),
    );
  }
}

class OtherWidget extends StatefulWidget {
  const OtherWidget({Key? key}) : super(key: key);

  @override
  _OtherWidgetState createState() => _OtherWidgetState();
}

class _OtherWidgetState extends State<OtherWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              hintText: "Example : name "
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
              onPressed: (){

              },
              child: Text("Change Name")
          )
        ],
      ),
    );
  }
}

