import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkTutorialStatus();
  }

  Future<void> _checkTutorialStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool showTutorial = prefs.getBool('showTutorial') ?? true;

    // Redirige según el estado del tutorial
    Future.delayed(const Duration(seconds: 2), () {
      if (showTutorial) {
        Navigator.pushReplacementNamed(context, '/tutorial');
      } else {
        Navigator.pushReplacementNamed(context, '/home');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
