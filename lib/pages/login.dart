import 'package:flutter/material.dart';
import 'package:s7_cinema/datasource/local/storage.dart';
import 'package:s7_cinema/models/response/login_response/login_response.dart';
import 'package:s7_cinema/repository/auth/auth_repository.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(text: 'admin@cinema.com');
  final TextEditingController _passwordController = TextEditingController(text: '12345678');
  final api = ApiLogin.instance.restClient;

  onLogin() async {
    try {
      final response = await api.login({
        "email": "admin@cinema.com", //_emailController.text.trim()
        "password": "12345678", //_passwordController.text.trim()
      });
      LoginResponse? loginResponse = response.data;

      BaseBox.setToken(loginResponse.accessToken ?? '');
      BaseBox.setUserData(loginResponse);
      Navigator.pushNamed(context, 'home');
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_emailController.text.trim().isEmpty || _passwordController.text.trim().isEmpty) {
                  return;
                }
                onLogin();
              },
              child: const Text('Đăng nhập'),
            ),
          ],
        ),
      ),
    );
  }
}
