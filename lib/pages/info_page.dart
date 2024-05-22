// ignore_for_file: unnecessary_string_interpolations
import 'package:do_an_cuoi_ki/authen.dart';
import 'package:do_an_cuoi_ki/components/app_bar.dart';
import 'package:do_an_cuoi_ki/components/app_drawer.dart';
import 'package:do_an_cuoi_ki/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../components/food_item.dart';
import '../models/food_model.dart';
import '../pages/home_page.dart';

class InfoPage extends StatefulWidget {

  
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    VoidCallback _closeDrawer = () {
    Navigator.of(context).pop(); // Đóng drawer
    };
    return Scaffold(
      appBar: CustomAppBar(title: 'NHÀ THUỐC XANH'),
      body: const Center(
        child: Text('Infomation'),
      ),

   endDrawer: const AppDrawer(currentPage: 'InfoPage'),
    
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