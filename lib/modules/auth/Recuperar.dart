import 'package:flutter/material.dart';

class Recuperar extends StatefulWidget {
  const Recuperar({super.key});

  @override
  State<Recuperar> createState() => _LoginState();
}

class _LoginState extends State<Recuperar> {
  final TextEditingController _email = TextEditingController();

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
                hintText: 'Correo Electrónico',
                labelText: 'Correo Electrónico',
                labelStyle: TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
            ),
            const SizedBox(height: 48.0),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  print('Email: ${_email.text}');
                  Navigator.pushNamed(context, '/verificar');
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 80, 141),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Enviar Código'),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
