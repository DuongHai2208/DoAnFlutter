import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    this.height = 48.0,
    required this.text,
    this.textColor = Colors.white,
    this.color = Colors.red,
    this.borderColor = Colors.red,
  });
  final Function()? onPressed;
  final double height;
  final String text;
  final Color textColor;
  final Color color;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 26.0),
        alignment: Alignment.center,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(16.0)
            ),
            // boxShadow: const[
            //   BoxShadow(
            //     color: Colors.white,
            //     offset: Offset(0.0, 0.3),
            //     blurRadius: 6.0,
            //   )
            // ]
            ),
            child: Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: 16.8,
                fontWeight: FontWeight.w500
              ),
            ),
      ),
    );
  }
}
