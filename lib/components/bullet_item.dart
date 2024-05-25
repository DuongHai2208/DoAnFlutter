import 'package:flutter/material.dart';

class BulletItem extends StatelessWidget {
  const BulletItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}
