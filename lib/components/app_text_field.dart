import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.isPassword = false, // Default to false for non-password fields
    this.prefixIcon,
    this.hintText,
    this.textInputAction,
  });

  final TextEditingController? controller;
  final bool isPassword;
  final Icon? prefixIcon;
  final String? hintText;
  final TextInputAction? textInputAction;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _showPassword = false; // State variable to control password visibility

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.0,
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Color.fromARGB(255, 2, 165, 83), width: 1.2),
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 3.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          // Existing prefix icon if provided
          if (widget.prefixIcon != null) widget.prefixIcon!,
          const SizedBox(width: 10.0), // Add spacing between icons

          // Password field with toggle button
          Expanded(
            child: TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? !_showPassword : false, // Only hide text for password fields
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIconConstraints: const BoxConstraints(minWidth: 32.0),
                hintText: widget.hintText,
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility_off : Icons.visibility,
                          color:Color.fromARGB(255, 2, 165, 83),
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      )
                    : null, // Only show suffix icon for password fields
              ),
              textInputAction: widget.textInputAction,
            ),
          ),
        ],
      ),
    );
  }
}
