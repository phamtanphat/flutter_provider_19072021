import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class User extends ChangeNotifier{
  late String _name;
  late int _age;

  User(String name , int age){
    this._name = name;
    this._age = age;
  }

  set name (String name){
    this._name = name;
    notifyListeners();
  }

  String get name => this._name;

  set age (int age){
    this._age = age;
    notifyListeners();
  }

  int get age => this._age;
}

class DemoChangenotifierWidget extends StatefulWidget {

  @override
  _DemoChangenotifierWidgetState createState() => _DemoChangenotifierWidgetState();
}

class _DemoChangenotifierWidgetState extends State<DemoChangenotifierWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ChangeNotifier Proivder"),
      ),
      body: ChangeNotifierProvider(
        create: (context) => User("Nguyen Van C", 10),
        child: Center(
          child: Column(
            children: [
              TextInfoUserWidget(),
              ChangeInfoUserWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class TextInfoUserWidget extends StatefulWidget {

  @override
  _TextInfoUserWidgetState createState() => _TextInfoUserWidgetState();
}

class _TextInfoUserWidgetState extends State<TextInfoUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<User>(
      builder: (context , user , child){
        return Column(
          children: [
            Text(user.name),
            Text(user.age.toString())
          ],
        );
      },
    );
  }
}

class ChangeInfoUserWidget extends StatefulWidget {

  @override
  _ChangeInfoUserWidgetState createState() => _ChangeInfoUserWidgetState();
}

class _ChangeInfoUserWidgetState extends State<ChangeInfoUserWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){
          User user = context.read<User>();
          user.name = "efgh";
          user.age = 15;
        },
        child: Text("Change name")

    );
  }
}


