import 'package:dio/dio.dart';

import 'monitor_api.dart';

class MonitorService {
  Future<Map<String, double>> getLoginsData() {
    Dio _dio = Dio();
    MonitorApi client = MonitorApi(_dio);
    var r = client.login();
    //esse r é um observable<LoginResponse>
    print("------------");
    print(r.toString());
    var p = r.map((r) => r.a);
    //esse p é um Observable<double>
    print("------------");
    LoginResponse response = new LoginResponse(10, 70, 20);
    //LoginResponse response = new LoginResponse(p, 90, 30);
    return Future.value({"a": response.a, "b": response.b, "c": response.c});
  }
}
