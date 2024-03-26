import 'package:alumini_job_refer_app/endpoints/api.dart';

Future signUp(String name, String email, String password, String mobile) async {
  Map<String, String> requestBody = {
    'name': name,
    'email': email,
    'password': password,
    'mobile': mobile
  };
  String signUpEndpoint = 'signup';
  try {
    // Call the postData function with the token
    final response = await postData(requestBody, signUpEndpoint);
    if (response != null) {
      // Handle successful response
      return response;
    } else {
      // Request failed with an error code
      print("Error: ");
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    print("Error: $error");
  }
}

Future login(String mobile, String password) async {
  Map<String, String> requestBody = {
    'mobile': mobile,
    'password': password,
  };
  String loginEndpoint = 'login';
  try {
    // Call the postData function with the token
    final response = await postData(requestBody, loginEndpoint);
    if (response != null) {
      // Handle successful response
      return response;
    } else {
      // Request failed with an error code
      print("Error: ");
    }
  } catch (error) {
    // Handle any errors that occurred during the request
    print("Error: $error");
  }
}
