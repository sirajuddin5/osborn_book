// //
// //
// // import 'dart:convert';
// // import 'package:http/http.dart' as http;
// //
// // Future authenticateUser(String username, String password, String deviceId) async {
// //   late String deviceToken;
// //   final url = 'https://test-api-rho-umber.vercel.app/api/auth/get_device_token';
// //   final headers = {'Content-Type': 'application/json'};
// //   final body = json.encode({
// //     'username': username,
// //     'password': password,
// //     'deviceId': deviceId,
// //   });
// //
// //   // if(username.isEmpty || password.isEmpty){
// //   //
// //   //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter in both of the fields")));
// //   // }
// //
// //   try {
// //     final response = await http.post(
// //       Uri.parse(url),
// //       headers: headers,
// //       body: body,
// //     );
// //
// //     if (response.statusCode == 200) {
// //       // Successfully authenticated
// //       final responseData = json.decode(response.body);
// //       deviceToken = responseData.toString();
// //       return deviceToken;
// //       print('Authentication successful: $responseData');
// //       // Handle the response data as needed
// //     } else {
// //       return response.statusCode;
// //       // Failed to authenticate
// //       print('Authentication failed: ${response.statusCode}');
// //       // Handle error based on response status code or response body
// //     }
// //   } catch (e) {
// //     return e.toString();
// //     // Handle any exceptions
// //     print('An error occurred: $e');
// //   }
// // }
//
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:osborn_book/token/tokens.dart';
//
// class AuthResponse {
//   final String message;
//   final String deviceToken;
//   final String statusCode;
//   final String error;
//
//
//   AuthResponse(  {required this.message, required this.deviceToken,required this.statusCode,required this.error});
// }
//
// Future authenticateUser(String username, String password, String deviceId) async {
//   final url = 'https://test-api-rho-umber.vercel.app/api/auth/get_device_token';
//   final headers = {'Content-Type': 'application/json'};
//   final body = json.encode({
//     'username': username,
//     'password': password,
//     'deviceId': deviceId,
//   });
//
//   try {
//     final response = await http.post(
//       Uri.parse(url),
//       headers: headers,
//       body: body,
//     );
//
//     print("response : $response");
//
//     if (response.statusCode == 200) {
//       // Successfully authenticated
//       print("status code 200");
//       final responseData = json.decode(response.body);
//       String deviceToken = responseData['deviceToken'];
//       print("device token :"+deviceToken);
//       deviceTokenUniversal = deviceToken;
//       String message = responseData['status'].toString();
//       print('Authentication successful: $message');
//       return AuthResponse(message: message, deviceToken: deviceToken, statusCode: '200', error: 'no error' , );
//     } else {
//       print('Authentication failed: ${response.statusCode}');
//       return AuthResponse(message: "some Error", deviceToken: '', error: "error", statusCode: response.statusCode.toString());
//     }
//   } catch (e) {
//     print('An error occurred: $e');
//     return AuthResponse(message: "some Error", deviceToken: '', error: e.toString(), statusCode: '');
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthResponse {
  final String message;
  final String deviceToken;
  final String statusCode;
  final String error;


  AuthResponse(  {required this.message, required this.deviceToken,required this.statusCode,required this.error});
}

Future<void> _saveAuthToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('auth_token', token);
}

Future<void> _saveAuthStatus(bool isLoggedIn) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('is_logged_in', isLoggedIn);
}

Future<AuthResponse?> authenticateUser(String username, String password, String deviceId) async {
  final url = 'https://test-api-rho-umber.vercel.app/api/auth/get_device_token';
  final headers = {'Content-Type': 'application/json'};
  final body = json.encode({
    'username': username,
    'password': password,
    'deviceId': deviceId,
  });

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    print(json.decode(response.body));
    print("inside try block");
    print(response.statusCode);
    final responseData = json.decode(response.body);
    String message = responseData['status'].toString();
    String deviceToken = responseData['deviceToken'];
    print("message"+message);
    print("device TOken"+deviceToken);
    if (response.statusCode == 200) {
      // Successfully authenticated
      final responseData = json.decode(response.body);
      String message = responseData['status'].toString();
      String deviceToken = responseData['deviceToken'];
      print("message"+message);
      await _saveAuthToken(deviceToken);
      await _saveAuthStatus(true);

      print('Authentication successful: $deviceToken');
      return AuthResponse(message: message, deviceToken: deviceToken, statusCode: '200', error: 'no error' , );

    } else {
      print('Authentication failed: ${response.statusCode}');
      return AuthResponse(message: "Authentication failed ", deviceToken: '', error: "error", statusCode: response.statusCode.toString());
      // Return null or handle error based on status code
    }
  } catch (e) {
    print("outside try block try block");
    print('An error occurred: $e');
    return AuthResponse(message: "some Error occured", deviceToken: '', error: e.toString(), statusCode: '');
// Return null or handle error
  }
}
