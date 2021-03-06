import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Person {
  late ValueNotifier<String> name;
  Person({required this.name});
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
      body: Provider<Person>(
        create: (context) => Person(name: ValueNotifier("Nguyen Van A")),
        child: Consumer<Person>(
          builder: (context, person , child){
            return  ValueListenableProvider.value(
              value: person.name,
              child: Container(
                child:  Column(
                  children: [
                    SizedBox(height: 20),
                    ParentWidget(),
                    SizedBox(height: 20),
                    OtherWidget()
                  ],
                ),
              ),
            );
          }
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
    return Consumer<String>(
      builder: (context , name  , child ){
        return Container(
          child: Center(
            child: Text(name.toString()),
          ),
        );
      }
    );
  }
}

class OtherWidget extends StatefulWidget {

  @override
  _OtherWidgetState createState() => _OtherWidgetState();
}

class _OtherWidgetState extends State<OtherWidget> {
  final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          TextField(
            controller: textController,
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
                  Person person = context.read<Person>();
                  person.name.value = textController.text;
              },
              child: Text("Change Name")
          )
        ],
      ),
    );
  }
}

