import 'package:empresta/app/base/enviroment.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

abstract class HttpMockAdapter {
  static Future<Response> httpGet(String path) async {
    return await http.get(
      Uri.parse('${AppEnviroment.baseUrl}$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }

  static Future<Response> httpPost(String path) async {
    return await http.post(
      Uri.parse('${AppEnviroment.baseUrl}$path'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
  }
}
