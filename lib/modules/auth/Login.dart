import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _isObscure = true;

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
                labelStyle: const TextStyle(color: Colors.black),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              keyboardType: TextInputType.emailAddress,
              controller: _email,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Contraseña',
                labelText: 'Contraseña',
                labelStyle: TextStyle(color: Colors.black),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                      });
                    },
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              controller: _password,
              obscureText: _isObscure,
            ),
            const SizedBox(height: 48.0),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () async {
                  print('Email: ${_email.text}');
                  print('Password: ${_password.text}');
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _email.text, password: _password.text);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      print('No user found for that email.');
                    } else if (e.code == 'wrong-password') {
                      print('Wrong password provided for that user.');
                    }
                  }
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 5, 80, 141),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text('Iniciar Sesión'),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/recuperar');
                },
                child: const Text(
                  'Recuperar Contraseña',
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Color.fromARGB(
                        255, 5, 80, 141), // Cambia el color aquí si deseas
                    fontSize: 16, // Ajusta el tamaño de fuente si es necesario
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
