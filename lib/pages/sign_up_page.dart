import 'package:do_an_cuoi_ki/pages/home_page.dart';
import 'package:do_an_cuoi_ki/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../components/app_elevated_button.dart';
import '../components/app_text_field.dart';
import 'home_page.dart';
import '../authen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});



  @override
  State<SignUpPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  bool _isLoading = false; // Flag for loading state

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }
 Future<void> _check() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      final String fullname = fullnameController.text.trim();
      final String email = emailController.text.trim();
      final String username = usernameController.text.trim();
      final String password = passwordController.text.trim();
      

      if (username.isEmpty || password.isEmpty || fullname.isEmpty || username.isEmpty) {
        _showSnackBar('Vui lòng điền đầy đủ thông tin.');
        setState(() {
          _isLoading = false;
        });
        return; 
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('fullname', fullname);
      await prefs.setString('email', email);
      await prefs.setString('username', username);
      await prefs.setString('password', password);


      _showSnackBar('Đăng kí thành công');
      Route route = MaterialPageRoute(
        builder: (context) => const LoginPage(),
        );
      Navigator.pushAndRemoveUntil(
        context,
        route,
        (Route<dynamic> route)=> false, // Sửa thành trang đăng nhập của bạn
      );
    } catch (error) {
      _showSnackBar('Đã xảy ra lỗi. Vui lòng thử lại sau.');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  
}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
            
          },
          
      child: Scaffold(
        appBar: AppBar( // AppBar hiển thị ở đầu màn hình
          backgroundColor: Color.fromARGB(255, 2, 165, 83), // Màu nền của AppBar
          title: Text(
            'SIGN IN',
            style: TextStyle(color: Colors.white,),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40.0, bottom: 30.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        height: 50.0, // Chiều cao của hình ảnh
                        width: 50.0, // Chiều rộng của hình ảnh
                        child: 
                        Image.asset(
                          'assets/images/logo.jpg',
                          fit: BoxFit.contain, // Đặt fit: BoxFit.contain để hình ảnh vừa với Container
                        ),
                      ),
                      Text(
                        'MEDICAL',
                        style: TextStyle(color: Color.fromARGB(255, 2, 165, 83), fontSize: 24.0),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppTextField(
                          controller: fullnameController,
                          isPassword: false,
                          prefixIcon:
                              const Icon(Icons.abc, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Fullname',
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppTextField(
                          controller: emailController,
                          isPassword: false,
                          prefixIcon:
                              const Icon(Icons.email, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Email',
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppTextField(
                          controller: usernameController,
                          isPassword: false,
                          prefixIcon:
                              const Icon(Icons.person, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Username',
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 22.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AppTextField(
                          controller: passwordController,
                          isPassword: true,
                          prefixIcon:
                              const Icon(Icons.password, color: Color.fromARGB(255, 2, 165, 83)),
                          hintText: 'Password',
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      
                      const SizedBox(height: 46.0),
                      FractionallySizedBox(
                        widthFactor: 0.4,
                       child: _isLoading
                        ? CircularProgressIndicator() // Show loading indicator
                        : AppElevatedButton(
                        onPressed: _check,
                        text: 'Đăng Kí',
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 2, 165, 83),
                      ),
                      ),
                        
                    ],
                    
                  ),
                ),
                
              ),
              
            ),
            
            
          ],
          
        ),
        
      ),
      
    );
  }
}
