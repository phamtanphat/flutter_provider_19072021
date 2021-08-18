import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class CounterApi extends ChangeNotifier{
  int _count;

  CounterApi({required int count}) : this._count = count;

  int get count => _count;

  set count(int count){
    this._count = count;
    notifyListeners();
  }
}

class CounterService extends ChangeNotifier{
  late CounterApi _counterApi;

  CounterService();

  void updateCounterApi(CounterApi counterApi){
    this._counterApi = counterApi;
    notifyListeners();
  }

  CounterApi get counterApi => _counterApi;

  set counterApi(CounterApi value) {
    _counterApi = value;
  }
}

class CounterModel extends ChangeNotifier{
  late CounterService _counterService;

  CounterModel();

  void updateCounterService(CounterService counterService){
    this._counterService = counterService;
    notifyListeners();
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
        ChangeNotifierProvider(create: (context) => CounterApi(count: 10)),
        ChangeNotifierProxyProvider<CounterApi,CounterService>(
          create: (context) => CounterService(),
          update: (context, counterApi , counterService){
            print("update service");
            counterService!.updateCounterApi(counterApi);
            return counterService;
          },
        ),
        ChangeNotifierProxyProvider<CounterService,CounterModel>(
          create: (context) => CounterModel(),
          update: (context,counterService , counterModel){
            print("update model");
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
            builder: (context , counterModel , child){
              return Column(
                children: [
                  Text(counterModel.counterService.counterApi.count.toString()),
                  ElevatedButton(
                      onPressed: (){
                        counterModel.counterService.counterApi.count++;
                      },
                      child: Text("Increment")
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}



