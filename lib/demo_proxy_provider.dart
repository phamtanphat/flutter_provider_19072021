
class CounterApi{
  int _count = 1;

  int get count => _count;
}

class CounterService{
  CounterApi _counterApi;

  CounterService({@required CounterApi api}) : _counterApi = api;

  CounterApi get counterApi => _counterApi;
}

class CounterModel {
  CounterService _counterService;

  CounterModel({@required CounterService counterService}) : _counterService = counterService;

  CounterService get counterService => _counterService;
}
