import 'package:do_an_cuoi_ki/pages/home_page.dart';
import 'package:do_an_cuoi_ki/pages/sign_up_page.dart';
import 'package:flutter/material.dart';
import '../components/app_elevated_button.dart';
import '../components/app_text_field.dart';
import 'home_page.dart';
import '../authen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});



  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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

  Future<void> _handleLogin() async {
    setState(() {
      _isLoading = true; // Show loading indicator
    });

    try {
      final String username = usernameController.text.trim();
      final String password = passwordController.text.trim();
      
      if (username.isEmpty) {
        _showSnackBar('Username còn trống.');
        setState(() {
          _isLoading = false;
        });
        return; 
      }

      final bool isLoginSuccessful = await AuthService.login(username, password);

      if (isLoginSuccessful) {
        // Navigate to Screen2 on successful login
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
          
        );
        _showSnackBar('Đăng nhập thành công!');
      } else {
        _showSnackBar('Đăng nhập thất bại. Vui lòng kiểm tra lại Username và Password');
      }
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
      onTap: () => FocusScope.of(context).unfocus(),
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
                      const SizedBox(height: 32.0),
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
                        onPressed: _handleLogin,
                        text: 'Đăng Nhập',
                        textColor: Colors.white,
                        color: Color.fromARGB(255, 2, 165, 83),
                      ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        Text(
                        'Bạn chưa có tài khoản? ',
                        style: TextStyle(color: Color.fromARGB(255, 2, 165, 83), fontSize: 16.8),
                        textAlign: TextAlign.center,
                      ),
                      AppElevatedButton(
                        onPressed: (){
                          Route route = MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                          );
                          Navigator.push(
                          context,
                          route,
                          
                          );
                        },
                        height:25.0,
                        text: 'Đăng ký',
                        textColor: Color.fromARGB(255, 2, 165, 83),
                        color: Colors.white,
                      ),
                      ],
                      )
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
