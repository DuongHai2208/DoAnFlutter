import 'package:do_an_cuoi_ki/authen.dart';
import 'package:do_an_cuoi_ki/components/app_elevated_button.dart';
import 'package:do_an_cuoi_ki/pages/home_page.dart';
import 'package:do_an_cuoi_ki/pages/info_page.dart';
import 'package:do_an_cuoi_ki/pages/login_page.dart';
import 'package:flutter/material.dart';


class AppDrawer extends StatelessWidget {
  final String currentPage;

  const AppDrawer({required this.currentPage, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoidCallback _closeDrawer = () {
      Navigator.of(context).pop();
    };

    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 2, 165, 83),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 40.0,
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 14.0),
                Text(
                  Authen.fullname,
                  style: const TextStyle(color: Colors.white, fontSize: 24.0),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text(
              "Trang chủ",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
              _closeDrawer();
              if (currentPage != 'HomePage') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text(
              "Sản Phẩm",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.newspaper),
            title: const Text(
              "Tin tức y tế",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text(
              "Thông tin",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
              _closeDrawer();
              if (currentPage != 'InfoPage') {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoPage(),
                  ),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.support_agent),
            title: const Text(
              "Hỗ trợ",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text(
              "Đăng Xuất",
              style: TextStyle(color: Color.fromARGB(255, 2, 165, 83)),
            ),
            onTap: () {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Đăng Xuất"),
                  content: Text("Bạn chắc chắn muốn đăng xuất?", style: TextStyle(color: Colors.grey),),
                  actions: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
              
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1.0),
                            child: TextButton(
                              child: const Text(
                                      'No',
                                      style: TextStyle(color: Color.fromARGB(255, 2, 165, 83), fontSize: 16.8),
                                    ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1.0),
                          child: TextButton(
                              child: const Text(
                                      'Yes',
                                      style: TextStyle(color: Color.fromARGB(255, 2, 165, 83), fontSize: 16.8),
                                    ),
                            onPressed: () {
                              Navigator.of(context).pop();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage(),
                                ),
                              );
                            },
                          ),
                        ),
                        
                      ],
                    ),
                  ],
                );
              },
            );
            },
          ),
        ],
      ),
    );
  }
}
