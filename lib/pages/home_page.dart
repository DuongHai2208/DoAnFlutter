// ignore_for_file: unnecessary_string_interpolations
import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/pages/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/food_item.dart';
import '../models/food_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  // void initState() {
  //   super.initState();
  //   SystemChrome.setSystemUIOverlayStyle(
  //     const SystemUiOverlayStyle(
  //       statusBarBrightness: Brightness.light,
  //       statusBarIconBrightness: Brightness.dark,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    VoidCallback _closeDrawer = () {
    Navigator.of(context).pop(); // Đóng drawer
    };
    return Scaffold(
      appBar: CustomAppBar(title: 'MEDICAL | Trang chủ'),
          body: const Center(
        child: Text('Home Page'),
      ),
    endDrawer: const AppDrawer(currentPage: 'HomePage'),

  
      //    body: Stack(
      //     children: [
      //       GestureDetector(
      //         onHorizontalDragUpdate: (details) {
      //           if (details.delta.dx > 0 && !_isMenuOpen) {
      //             setState(() {
      //               _isMenuOpen = true;
      //             });
      //           } else if (details.delta.dx < 0 && _isMenuOpen) {
      //             setState(() {
      //               _isMenuOpen = false;
      //             });
      //           }
      //         },
      //         child: AnimatedContainer(
      //       duration: Duration(milliseconds: 250),
      //       transform: Matrix4.identity()..translate(_isMenuOpen ? 0 : _menuWidth),
      //       child: Container(
      //         width: _menuWidth,
      //         color: Color.fromARGB(255, 255, 255, 255),
      //         child: ListView(
      //           children: [
      //             DrawerHeader(
      //               decoration: BoxDecoration(
      //                 color: Color.fromARGB(255, 2, 165, 83),
      //               ),
      //               child: Text(
      //                 '${widget.username}',
      //                 style: TextStyle(color: Colors.white, fontSize: 24.0),
      //               ),
      //             ),
      //             ListTile(
      //               title: Text('Trang chủ'),
      //               leading: Icon(Icons.home),
      //               onTap: () {
      //                 setState(() {
      //                   _isMenuOpen = false; // Close the menu
      //                 });
      //                 // Navigate to home page
      //               },
      //             ),
      //             ListTile(
      //               title: Text('Thông tin'),
      //               leading: Icon(Icons.info),
      //               onTap: () {
      //                 setState(() {
      //                   _isMenuOpen = false; // Close the menu
      //                 });
      //                 // Navigate to information page
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //       ),

      //     // Menu
          
      //   ],
        
      // ),
    );

      

  }
}
    // body:Center(
    //   child: Builder(
    //       builder: (BuildContext context) {
    //         return ElevatedButton(
    //           onPressed: () {
    //             Scaffold.of(context).openDrawer();
    //           },
    //           child: Text('Mở Drawer'),
    //         );
    //       }
    //   ),
    // ),