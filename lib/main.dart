import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:osama2/core/services/services_local.dart';
import 'package:osama2/core/strings/app_string.dart';
import 'package:osama2/movies/presentation/screens/splash_screen.dart';
 
   
void main() async{
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  ServicesLocator().init();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppString.appName,
      theme: ThemeData.dark()
          .copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const SplashScreen(),
    );
  }

 }

 