// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:http/http.dart' as http;

Future<dynamic> postData(Map<String, String> body, String endpoint) async {
  String url = 'https://853b-172-190-111-47.ngrok-free.app';
  String fullUrl = '$url/$endpoint';

  Map<String, String> headers = {
    'content-Type': 'application/json',
  };

  String responseJson = jsonEncode(body);
  try {
    http.Response response = await http.post(Uri.parse(fullUrl),
        headers: headers, body: responseJson);
    if (response.statusCode == 200) {
      return response;
    }
  } catch (error) {
    print('Error from API: $error');
  }
}
