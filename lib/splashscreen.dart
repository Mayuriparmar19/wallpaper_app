import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:wallpaper_app/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key,});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    navigateToHome();
  }

  navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {});
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Color(0xFF41C2FF), Color(0xFF7A50FF)]),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Lottie.asset(
                'Assets/animation_ln005edq.json',
                height: 500,
                width: 500,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Get Your Wallpaper',
              style: TextStyle(fontSize: 26, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
