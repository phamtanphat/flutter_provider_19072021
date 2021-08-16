import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class DemoStreamProvider extends StatefulWidget {

  @override
  _DemoStreamProviderState createState() => _DemoStreamProviderState();
}

class _DemoStreamProviderState extends State<DemoStreamProvider> {
  StreamController<int> controller = StreamController();

  @override
  void didUpdateWidget(covariant DemoStreamProvider oldWidget) {
    super.didUpdateWidget(oldWidget);
    controller.sink.addError(-100);
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<int>(
      initialData: 0,
      create:(context) => controller.stream,
      catchError: (context , e) {
        return -100;
      },
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