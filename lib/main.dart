import 'package:dhmsmobileapp/app.dart';
import 'package:dhmsmobileapp/features/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StartProject());
}

class StartProject extends StatelessWidget {
  const StartProject({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: SplashScreen(),
    );
  }
}
