import 'dart:async';

import 'package:do_an_cuoi_ki/pages/login_page.dart';
import 'package:do_an_cuoi_ki/pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2000), () {
      Route route = MaterialPageRoute(
        builder: (context) => Onboarding(),
      );
      Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/background.jpg',
            width: size.width,
            height: size.height,
            fit: BoxFit.fill,
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logo.jpg',
                  width: 160.0,
                ),
                SizedBox(height: 20),
                Text(
                  'MEDICINE APP',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 2, 165, 83),  // Đặt màu chữ phù hợp với nền của bạn
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
