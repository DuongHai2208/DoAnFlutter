import 'package:do_an_cuoi_ki/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'app_drawer.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  CustomAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 2, 165, 83),
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0), // Đảm bảo hình ảnh không bị cắt xén
        child: Image.asset(
          'assets/images/logo.jpg',
          fit: BoxFit.contain,
        ),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchPage(),
                  ),
            );
          },
        ),
        Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            );
          },
        ),
      ],
         
    );

  }
  
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
