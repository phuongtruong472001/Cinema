import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:s7_cinema/repository/auth/auth_repository.dart';
import 'package:s7_cinema/widgets/base_input.dart';
import 'package:s7_cinema/widgets/base_snackbar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final api = ApiLogin.instance.restClient;

  final formkey = GlobalKey<FormState>();

  void doSignUp() async {
    EasyLoading.show(status: 'loading...');
    try {
      await api.register({
        "name": _nameController.text.trim(),
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
      });

      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(message: 'Đăng ký thành công'));
      Navigator.pushNamed(context, 'login');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(baseSnackbar(message: 'Có lỗi xảy xa, vui lòng thử lại'));
      print(error);
    }
    EasyLoading.dismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng ký'),
      ),
      body: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              BaseInput(
                controller: _nameController,
                label: 'Họ và tên',
                validator: (p0) {
                  if (p0 == '' && p0!.isEmpty) return 'Họ và tên không được để trống';
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              BaseInput(
                controller: _emailController,
                label: 'Email',
                validator: (p0) {
                  if (p0 == '' && p0!.isEmpty) return 'Email không được để trống';
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(p0!)) return 'Email không hợp lệ';
                  return null;
                },
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
              BaseInput(
                controller: _confirmPasswordController,
                obscureText: true,
                label: 'Nhập lại mật khẩu',
                validator: (p0) {
                  if (p0 == '' && p0!.isEmpty) return 'Mật khẩu không được để trống';
                  if (p0!.length < 8) return 'Mật khẩu phải có ít nhất 8 ký tự';
                  if (p0 != _passwordController.text) return 'Mật khẩu không khớp';
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    doSignUp();
                  }
                },
                child: const Text('Đăng ký'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('Đã có tài khoản?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'login');
                    },
                    child: const Text('Đăng nhập'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
