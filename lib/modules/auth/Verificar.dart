import 'package:flutter/material.dart';

class Verificar extends StatefulWidget {
  const Verificar({super.key});

  @override
  State<Verificar> createState() => _LoginState();
}

class _LoginState extends State<Verificar> {
  final TextEditingController _codigo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset('assets/user.png', width: 200, height: 200),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Código de Verificación',
                labelText: 'Código de Verificación',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: _codigo,
            ),
            const SizedBox(height: 48.0),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  print('Codigo: ${_codigo.text}');
                  Navigator.pushNamed(context, '/resetPassword');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 80, 141),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Válidar Código'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
