import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/components/app_elevated_button.dart';

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  Map<String, dynamic> prefsMap = {};

  @override
  void initState() {
    super.initState();
    loadSharedPreferences();
  }

  Future<void> loadSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      prefsMap = prefs.getKeys().fold({}, (map, key) {
        map[key] = prefs.get(key);
        return map;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Thông tin'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: prefsMap.isNotEmpty
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'THÔNG TIN TÀI KHOẢN',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    _buildInfoRow('Họ và tên:', prefsMap['fullname']),
                    const Divider(),
                    _buildInfoRow('Email:', prefsMap['email']),
                    const Divider(),
                    _buildInfoRow('Tên tài khoản:', prefsMap['username']),
                    const Divider(),
                  ],
                )
              : const CircularProgressIndicator(),
        ),
      ),
      endDrawer: const AppDrawer(currentPage: 'InfoPage'),
    );
  }

  Widget _buildInfoRow(String label, String? value, {bool isPassword = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Color.fromARGB(255, 2, 165, 83),
            ),
          ),
          const SizedBox(height: 5),
          isPassword
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '********',
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(width: 10),
                    SizedBox(
                      height: 30.0,
                      child: AppElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/change_password');
                        },
                        text: 'Đổi mật khẩu',
                        textColor: const Color.fromARGB(255, 2, 165, 83),
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              : Text(
                  value ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
        ],
      ),
    );
  }
}
