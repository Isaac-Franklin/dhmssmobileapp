import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../onboardingflow/onboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 10), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const StartSliderSection()),
        // MaterialPageRoute(builder: (_) => const NavSection()),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage('assets/images/dhms.png'),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              'Device Health Management  System',
              style: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
            const SizedBox(
              height: 150,
            ),
            Positioned(
              bottom: 5,
              child: Container(
                padding: const EdgeInsets.all(1),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Powered by',
                        style: TextStyle(
                          color: Colors.grey[350],
                          fontSize: 16,
                          fontFamily: 'Nunito',
                        ),
                      ),
                      const Text(
                        'IT Service Desk Africa',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 28,
                          fontFamily: 'Nunito',
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
