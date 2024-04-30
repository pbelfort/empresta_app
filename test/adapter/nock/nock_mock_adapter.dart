import 'package:empresta/app/base/enviroment.dart';
import 'package:nock/nock.dart';

abstract class NockMockAdapter {
  static Interceptor nockGetInterceptor({
    required String path,
    required dynamic body,
  }) {
    return nock(AppEnviroment.baseUrl).get(path)
      ..reply(
        200,
        body,
      );
  }

  static Interceptor nockPostInterceptor({
    required String path,
    required dynamic body,
  }) {
    return nock(AppEnviroment.baseUrl).post(path)
      ..reply(
        200,
        body,
      );
  }
}
