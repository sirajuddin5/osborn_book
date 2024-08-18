import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:osborn_book/connectivity/internet_controller.dart';
import 'package:osborn_book/home/home_page.dart';
import 'package:osborn_book/onboarding/onboarding_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedIn = await _checkAuthStatus();
  String? deviceToken = await getDeviceToken();
  runApp(MyApp(isLoggedIn: isLoggedIn,));
  Get.put(InternetController(),permanent: true);
}

Future<bool> _checkAuthStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('is_logged_in') ?? false;
}

Future<String?> getDeviceToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  print(prefs.getString('device_token'));
  return prefs.getString('device_token');
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: isLoggedIn?HomePage(deviceToken: getDeviceToken().toString()): const OnboardingPage(),
      // home:  PublicationsScreen(),

    //njn
    );
  }
}

