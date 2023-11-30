import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  String _errorText = '';
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.purple, Colors.blue],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50.0,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('assets/perfil.png'),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 350,
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: const Icon(Icons.person),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _errorText = ''; 
                  });
                },
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: 350,
              child: TextField(
                controller: _emailController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.lock),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onTap: () {
                  setState(() {
                    _errorText = ''; 
                  });
                },
              ),
            ),
            const SizedBox(height: 8.0),
            SizedBox(
              width: 350,
              child: Text(
                _errorText,
                style: const TextStyle(
                  color: Colors.orange,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                String name = _nameController.text;
                String email = _emailController.text;

                if (name.isEmpty || email.isEmpty) {
                  _displayError('Usuario y contraseña son requeridos');
                } else if (name.isEmpty) {
                  _displayError('Usuario es requerido');
                } else if (email.isEmpty) {
                  _displayError('Contraseña es requerida');
                } else {
                  _displaySuccess('Login exitoso');

                  if (kDebugMode) {
                    print('Name: $name');
                    print('Email: $email');
                  }
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  void _displayError(String errorMessage) {
    setState(() {
      _errorText = errorMessage;
    });

    _timer = Timer(const Duration(seconds: 4), () {
      setState(() {
        _errorText = '';
      });
    });
  }

  void _displaySuccess(String successMessage) {
    setState(() {
      _errorText = successMessage;
    });

    _timer = Timer(const Duration(seconds: 4), () {
      setState(() {
        _errorText = '';
      });
    });
  }
}
