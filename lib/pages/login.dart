import 'package:flutter/material.dart';
import 'package:s7_cinema/datasource/local/storage.dart';
import 'package:s7_cinema/models/response/login_response/login_response.dart';
import 'package:s7_cinema/repository/auth/auth_repository.dart';
import 'package:s7_cinema/widgets/base_input.dart';
import 'package:s7_cinema/widgets/base_snackbar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController(text: 'admin@cinema.com');

  ///'phuongphuong2001@gmail.com');
  final TextEditingController _passwordController = TextEditingController(text: '12345678');
  final api = ApiLogin.instance.restClient;

  final formkey = GlobalKey<FormState>();

  onLogin() async {
    try {
      final response = await api.login({
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
      });
      LoginResponse? loginResponse = response.data;

      BaseBox.setToken(loginResponse.accessToken ?? '');
      print(BaseBox.getToken());
      BaseBox.setUserData(loginResponse);
      Navigator.pushNamed(context, loginResponse.role == 2 ? 'home_ad' : 'home');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(isSuccess: false, message: 'Có lỗi xảy xa, vui lòng thử lại'));
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập'),
      ),
      body: Center(
        child: SizedBox(
          width: 500,
          child: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BaseInput(
                    controller: _emailController,
                    label: 'Email',
                    validator: (p0) => p0!.isEmpty ? 'Email không được để trống' : null,
                  ),
                  const SizedBox(height: 20.0),
                  BaseInput(
                    controller: _passwordController,
                    obscureText: true,
                    label: 'Mật khẩu',
                    validator: (p0) {
                      if (p0 == '' && p0!.isEmpty) return 'Mật khẩu không được để trống';
                      return p0!.length < 8 ? 'Mật khẩu phải có ít nhất 8 ký tự' : null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        onLogin();
                      }
                    },
                    child: const Text('Đăng nhập'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Chưa có tài khoản?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'register');
                        },
                        child: const Text('Đăng ký'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
