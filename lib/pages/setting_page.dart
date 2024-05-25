import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/pages/changepassword_page.dart';
import 'package:do_an_cuoi_ki/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatelessWidget {
  Future<String?> _getFullName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('fullname');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Trang chủ'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/avatar.png'), // Thay thế bằng đường dẫn đến ảnh avatar của bạn
            ),
            const SizedBox(height: 10),
            FutureBuilder<String?>(
              future: _getFullName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text(
                    'Lỗi khi tải tên đầy đủ',
                    style: TextStyle(color: Colors.red),
                  );
                } else {
                  final fullName = snapshot.data ?? 'Tên đầy đủ';
                  return Text(
                    fullName,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  );
                }
              },
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Thông tin tài khoản'),
              leading: const Icon(Icons.info),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  ),
                );
              },
            ),
            ListTile(
              title: const Text('Đổi mật khẩu'),
              leading: const Icon(Icons.lock),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ChangePasswordPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      endDrawer: const AppDrawer(currentPage: 'SettingPage'),
    );
  }
}
