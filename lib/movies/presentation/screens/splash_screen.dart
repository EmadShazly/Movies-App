 
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:osama2/movies/presentation/screens/movie_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

@override
  void initState() {

    Timer(
        const Duration(seconds: 3),
        () => Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => const MainMoviesScreen(),
        ),
      ),
    );
     super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
        Colors.grey,
        Colors.blueGrey,
      ],),),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              Image.asset(
              'assets/images/splash.jpg',
              fit: BoxFit.fill,
                height: 300,
                width: 300,
              ),
              const Text('Best Movie',style: TextStyle(fontSize: 40),),
            const SizedBox(height: 200),
              const CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}