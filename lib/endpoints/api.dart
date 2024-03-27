// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:alumini_job_refer_app/endpoints/tokenhandler.dart';
import 'package:http/http.dart' as http;

Future<dynamic> postData(Map<String, String> body, String endpoint) async {
  String url = 'https://17ec-20-161-43-236.ngrok-free.app';
  String fullUrl = '$url/$endpoint';
  String? token = await TokenHandler.getToken('token');

  Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $token'
  };

  final responseJson = jsonEncode(body);
  final http.Response response =
      await http.post(Uri.parse(fullUrl), headers: headers, body: responseJson);
  try {
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData;
    }
  } catch (error) {
    print('Error from API: $error');
  }
}
