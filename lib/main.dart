import 'package:dhmsmobileapp/app.dart';
import 'package:dhmsmobileapp/features/onboardingflow/bloc/slider_screen_bloc_bloc.dart';
import 'package:dhmsmobileapp/features/splashscreen/splashscreen.dart';
import 'package:dhmsmobileapp/features/studentsignup/bloc/studentonboarding_bloc.dart';
import 'package:dhmsmobileapp/utils/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => SliderScreenBlocBloc(),
      ),
      BlocProvider(
        create: (context) => StudentonboardingBloc(ApiClient()),
      ),
    ],
    child: const StartProject(),
  ));
}

class StartProject extends StatelessWidget {
  const StartProject({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
