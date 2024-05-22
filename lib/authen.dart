class Authen {
 static String username = 'hai';
 static String password = '123456';
 static String email = 'hai@123';
 static String fullname = 'Duong Hien Hai';
}
class AuthService {
  static Future<bool> login(String username, String password) async {
    if (username == 'hai' && password == '123456') {
      return true; 
    } else {
      return false; 
    }
  }
}