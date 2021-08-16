import 'package:flutter/material.dart';
import 'package:flutter_provider_19072021/basic_provider.dart';
import 'package:flutter_provider_19072021/demo_changenotifier.dart';
import 'package:flutter_provider_19072021/demo_future_provider.dart';
import 'package:flutter_provider_19072021/demo_stream_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DemoStreamProvider(),
    );
  }
}
