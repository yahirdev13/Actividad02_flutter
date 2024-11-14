import 'package:actividad_02/navigation/Navigation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  Future<void> _setNoShowTutorial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showTutorial', false);
    Navigator.pushReplacementNamed(context, '/home'); // Navega a home
  }

  void _onItemTapped() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('showTutorial', true); // Guarda que no mostró tutorial
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          children: [
            Image.network(
              'https://placehold.co/600x376',
              width: double.infinity,
              height: 376,
              errorBuilder: (context, error, stackTrace) {
                return const Icon(Icons.error);
              },
            ),
            const Center(
              child: Text(
                'Bienvenido a la app',
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, '/home'); // Navega a home
              },
              child: const Text('Comenzar'),
            ),
            InkWell(
              onTap: () {
                _setNoShowTutorial(); // No mostrar más el tutorial
              },
              child: const Text('No mostrar más'),
            ),
          ],
        ),
      ),
    );
  }
}
