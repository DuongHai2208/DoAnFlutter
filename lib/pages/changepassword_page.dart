import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/components/app_elevated_button.dart';
import 'package:do_an_cuoi_ki/components/app_text_field.dart';
import 'package:do_an_cuoi_ki/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePasswordPage extends StatefulWidget {
  @override
  _ChangePasswordPageState createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController _oldPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  String _warningMessage = '';

  Future<void> _updatePassword(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPassword = prefs.getString('password');

    setState(() {
      _warningMessage = '';
    });

    if (_oldPasswordController.text == savedPassword) {
      if (_newPasswordController.text == _confirmPasswordController.text) {
        await prefs.setString('password', _newPasswordController.text);
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Cập nhật mật khẩu thành công')),
        );
        Route route = MaterialPageRoute(
        builder: (context) => const LoginPage(),
        );
        Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route)=> false, // Sửa thành trang đăng nhập của bạn
      );
      } else {
        setState(() {
          _warningMessage = 'Nhập lại mật khẩu không khớp';
        });
      }
    } else {
      setState(() {
        _warningMessage = 'Mật khẩu cũ không đúng';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Trang chủ'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AppTextField(
                          controller: _oldPasswordController,
                          isPassword: true,
                          prefixIcon: const Icon(Icons.password, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Mật khẩu cũ',
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 16.0,),
            AppTextField(
                          controller: _newPasswordController,
                          isPassword: true,
                          prefixIcon: const Icon(Icons.password, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Mật khẩu mới',
                          textInputAction: TextInputAction.done,
                        ),
                        SizedBox(height: 16.0,),
            AppTextField(
                          controller: _confirmPasswordController,
                          isPassword: true,
                          prefixIcon: const Icon(Icons.password, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Xác nhận lại mật khẩu',
                          textInputAction: TextInputAction.done,
                        ),
            if (_warningMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _warningMessage,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            const SizedBox(height: 20),
            AppElevatedButton(
              onPressed: () {
                _updatePassword(context);
              },
              text:  'Cập nhật',
              color: Color.fromARGB(255, 2, 165, 83),
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(currentPage: '')
    );
  }
}
