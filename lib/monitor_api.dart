import 'package:dio/dio.dart';
import 'package:rxdart/rxdart.dart';

class MonitorApi {
  final Dio _dio;

  MonitorApi(this._dio);

  Observable<LoginResponse> login() {
    final _endpoint = "/endpoint";
    return Observable.fromFuture(_dio.get(_endpoint)).map(
      (response) => LoginResponse(10, 90, 30),
    );
  }
}

class LoginResponse {
  final double a;
  final double b;
  final double c;

  LoginResponse(this.a, this.b, this.c);
}
