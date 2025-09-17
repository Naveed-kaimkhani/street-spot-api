import 'dart:developer';

import 'package:StreetSpot/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ApiClient extends GetxService {
  final UserController userController = Get.find<UserController>();

  Future<http.Response> post({
    required String url,
    Object? body,
  }) async {
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer ${userController.token.value}",
    };
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
  }

  Future<http.Response> get({
    required String url,
  }) async {
    log("auth ${userController.token.value}");
    final headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjEiLCJjcmVhdGVkX2F0IjoiMjAyNS0wOS0xNVQxNzowMzoxNS4wMDBaIiwidXBkYXRlZF9hdCI6IjIwMjUtMDktMTVUMTc6MDM6MTUuMDAwWiIsImRlbGV0ZWRfYXQiOm51bGwsInVzZXJuYW1lIjoiYXNoYXIiLCJlbWFpbCI6ImFzaGFyQGdtYWlsLmNvbSIsInJvbGUiOiJUUlVDS19PV05FUiIsImRvbWFpbiI6IlNFTEYiLCJhY3RpdmUiOnRydWUsInByb2ZpbGVfcGljdHVyZSI6bnVsbCwicmVzZXRfdG9rZW4iOm51bGwsIm90cCI6MTk1MywicGhvbmVfbnVtYmVyIjpudWxsLCJkYXRlX29mX2JpcnRoIjpudWxsLCJnZW5kZXIiOm51bGwsImlhdCI6MTc1ODA1MjA3NSwiZXhwIjoxNzU4MTM4NDc1fQ.LshUZfc6KxhHpBJii-jGgK_BxNkFMuLSMY2vwmkfy50",
      "Accept": "application/json",
    };
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
    return await http.post(Uri.parse(url), body: body);
  }

  Future<http.Response> signup({
    required String url,
    Object? body,
  }) async {
    return await http.post(Uri.parse(url), body: body);
  }
}
