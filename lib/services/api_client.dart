
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxService {

  
  Future<http.Response> post({
  required String url,
  Object? body,
}) async {
  return await http.post(
    Uri.parse(url),
    headers: {"Content-Type": "application/json"},
    body: body,
  );
}

  Future<http.Response> get({
    required String url,
    Map<String, String>? headers,
  }) async {
    return await http.get(Uri.parse(url), headers: headers);
  }

  Future<http.Response> delete({
    required String url,
    Object? body,
  }) async {
    return await http.delete(
      Uri.parse(url),
      body: body,
    );
  }

  Future<http.Response> put({
    required String url,
    Object? body,
    Map<String, String>? headers,
  }) async {
    return await http.put(
      Uri.parse(url),
      body: body,
      headers: headers,
    );
  }

 Future<http.Response> login({
    required String url,
    Object? body,
  }) async {
    
    return await http.post(Uri.parse(url), body:body
    );
  }
   Future<http.Response> signup({
    required String url,
    Object? body,
  }) async {
    
    return await http.post(Uri.parse(url), body:body
     );
  }
}
