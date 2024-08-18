import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:osborn_book/networking/publication_model.dart';
//
// Future<List<Publication>> fetchPublications() async {
//   print("fetch publication being called");
//
//   final response = await http.get(Uri.parse('https://test-api-rho-umber.vercel.app/api/testPub'));
//   print("response recieved");
//   print(response);
//
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     print(jsonResponse);
//     final publicationsJson = jsonResponse['result'] as List;
//     return publicationsJson.map((json) => Publication.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load publications');
//   }
// }

// Future<List<Publication>> fetchPublications() async {
//   print("fetch publication being called");
//
//   final response = await http.get(Uri.parse('https://test-api-rho-umber.vercel.app/api/testPub'));
//   print("response received");
//   print(response);
//
//   if (response.statusCode == 200) {
//     final jsonResponse = jsonDecode(response.body);
//     print(jsonResponse);
//     final publicationsJson = jsonResponse['result'] as List;
//     return publicationsJson.map((json) => Publication.fromJson(json)).toList();
//   } else {
//     throw Exception('Failed to load publications');
//   }
// }


// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:osborn_book/networking/publication_model.dart';
//
// Future<List<Publication>> fetchPublications() async {
//   print("Fetching publications...");
//
//   try {
//     final response = await http.get(Uri.parse('https://test-api-rho-umber.vercel.app/api/testPub'));
//
//     print("Response received with status code: ${response.statusCode}");
//     print(response);
//
//     if (response.statusCode == 200) {
//       final jsonResponse = jsonDecode(response.body);
//
//       // Check if 'result' is present and is a List
//       if (jsonResponse is Map<String, dynamic> && jsonResponse.containsKey('result') && jsonResponse['result'] is List) {
//         final publicationsJson = jsonResponse['result'] as List;
//         return publicationsJson.map((json) => Publication.fromJson(json)).toList();
//       } else {
//         throw Exception('Unexpected JSON structure');
//       }
//     } else {
//       throw Exception('Failed to load publications: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error occurred: $e');
//     throw Exception('Failed to load publications: $e');
//   }
// }
////////////////// the original one
Future<List<Publication>> fetchPublications() async {
  print("fetch publication being called");

  final response = await http.get(Uri.parse('https://test-api-rho-umber.vercel.app/api/testPub'));
  print("response received");
  print(response);

  if (response.statusCode == 200) {
    final jsonResponse = jsonDecode(response.body);
    print(jsonResponse);
    final List<dynamic> publicationsJson = jsonResponse; // List<dynamic> instead of Map
    return publicationsJson.map((json) => Publication.fromJson(json as Map<String, dynamic>)).toList();
  } else {
    throw Exception('Failed to load publications');
  }
}

