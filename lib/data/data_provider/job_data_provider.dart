// ignore_for_file: avoid_print

import 'dart:convert';
import 'package:alumini_job_refer_app/data/token/tokenhandler.dart';
import 'package:http/http.dart' as http;

class JobDataProvider {
  Future postData(Map<String, dynamic> body, String endpoint) async {
    String url = 'https://d4ed-20-55-126-194.ngrok-free.app';
    String fullUrl = '$url/$endpoint';
    String? token = await TokenHandler.getToken('token');

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final responseJson = jsonEncode(body);
      final http.Response response = await http.post(Uri.parse(fullUrl),
          headers: headers, body: responseJson);
      return response.body;
    } catch (error) {
      throw error.toString();
    }
  }

  Future<String> getData(String endpoint) async {
    String url = 'https://d4ed-20-55-126-194.ngrok-free.app';
    String fullUrl = '$url/$endpoint';
    String? token = await TokenHandler.getToken('token');
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    try {
      final http.Response response =
          await http.get(Uri.parse(fullUrl), headers: headers);
      return response.body;
    } catch (error) {
      throw error.toString();
    }
  }
}
