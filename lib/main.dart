import 'package:actividad_02/modules/auth/Login.dart';
import 'package:actividad_02/modules/auth/Recuperar.dart';
import 'package:actividad_02/modules/auth/Verificar.dart';
import 'package:actividad_02/modules/auth/ResetPassword.dart';
import 'package:actividad_02/widgets/SplashScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/login': (context) => const Login(),
        '/recuperar': (context) => const Recuperar(),
        '/verificar': (context) => const Verificar(),
        '/resetPassword': (context) => const ResetPassword(),
      },
    );
  }
}
