import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class HomePage extends StatelessWidget {
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;

    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Добро пожаловать, ${user?.email ?? 'Гость'}!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            if (user != null) ...[
              Text("Вы авторизованы, доступ к полному функционалу открыт."),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile');
                },
                child: Text('Перейти в профиль'),
              ),
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Доступ к эксклюзивному контенту')),
                  );
                },
                child: Text('Эксклюзивный контент'),
              ),
            ] else ...[
              Text("Чтобы получить полный доступ, войдите в аккаунт."),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/login');
                },
                child: Text('Войти'),
              ),
            ],
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () async {
                await _authService.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
