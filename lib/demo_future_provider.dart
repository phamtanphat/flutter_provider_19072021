import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DemoFutureProvider extends StatelessWidget {

  Future<int> getAge(){
    return Future.delayed(Duration(seconds: 10) , () => 400);
  }

  @override
  Widget build(BuildContext context) {
    return FutureProvider(
      initialData: 0,
      create:(context) => getAge(),
      child: DemoFutureWidget(),
    );
  }
}


class DemoFutureWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int value = Provider.of(context);
    return Center(
      child: Text(
        value.toString(),
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}