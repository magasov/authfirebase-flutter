import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _errorMessage = '';

  void _login() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    try {
      await AuthService().signInWithEmailPassword(email, password);

      if (AuthService().currentUser != null) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Ошибка входа: $e";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            if (_errorMessage.isNotEmpty) ...[
              SizedBox(height: 10),
              Text(
                _errorMessage,
                style: TextStyle(color: Colors.red),
              ),
            ],
            SizedBox(height: 20),
            ElevatedButton(
<<<<<<< HEAD
              onPressed: _login,
=======
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;

                await AuthService().signInWithEmailPassword(email, password);

                if (AuthService().currentUser != null) {
                  Navigator.pushReplacementNamed(context, '/home');
                }
              },
>>>>>>> 14626d3c527fcc11f6585fbe6f78d70aeed3405e
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
