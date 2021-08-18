import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CounterApi{
  int _count;

  CounterApi({required int count}) : this._count = count;

  int get count => _count;
}

class CounterService{
  late CounterApi _counterApi;

  CounterService();

  void updateCounterApi(CounterApi counterApi){
    this._counterApi = counterApi;
  }

  CounterApi get counterApi => _counterApi;

  set counterApi(CounterApi value) {
    _counterApi = value;
  }
}

class CounterModel {
  late CounterService _counterService;

  CounterModel();

  void updateCounterService(CounterService counterService){
    this._counterService = counterService;
  }

  CounterService get counterService => _counterService;

  set counterService(CounterService value) {
    _counterService = value;
  }
}

class DemoProxyProvider extends StatefulWidget {
  const DemoProxyProvider({Key? key}) : super(key: key);

  @override
  _DemoProxyProviderState createState() => _DemoProxyProviderState();
}

class _DemoProxyProviderState extends State<DemoProxyProvider> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CounterApi(count: 10)),
        ProxyProvider<CounterApi,CounterService>(
          create: (context) => CounterService(),
          update: (context, counterApi , counterService){
            counterService!.updateCounterApi(counterApi);
            return counterService;
          },
        ),
        ProxyProvider<CounterService,CounterModel>(
          create: (context) => CounterModel(),
          update: (context,counterService , counterModel){
            counterModel!.updateCounterService(counterService);
            return counterModel;
          },
        )
      ],
      child: ProxyContainerWidget(),
    );
  }
}

class ProxyContainerWidget extends StatefulWidget {

  @override
  _ProxyContainerWidgetState createState() => _ProxyContainerWidgetState();
}

class _ProxyContainerWidgetState extends State<ProxyContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo proxy"),
      ),
      body: Container(
        child: Center(
          child: Consumer<CounterModel>(
            builder: (context , model , child){
              return Text(model.counterService.counterApi.count.toString());
            },
          ),
        ),
      ),
    );
  }
}



