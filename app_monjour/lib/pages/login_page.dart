import 'package:app_monjour/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

const users = const {
  'alessiolerede@gmail.com': 'Alessio99',
  'claudiatarricone@gmail.com': 'Claudia00',
  'martinasapone@gmail.com': 'Martina99',
  'giacomocappon@gmail.com': 'Giacomo92',
  'martinavettoretti@gmail.com': 'Martina89',
  'marcorossi@gmail.com': 'Marco',
};

class LoginPage extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String> _recoverPassword(String email) async {
    return 'An email has been sent to recover your password.\nPlease check it!';
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      logo: AssetImage('assets/images/Logo_animato.gif'),
      onLogin: _authUser,
      onSignup: _signupUser,
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => AuthPage(),
        ));
      },
      onRecoverPassword: _recoverPassword,
      theme: LoginTheme(
        primaryColor: Color.fromARGB(248, 0, 150, 136),
        accentColor: Colors.yellow,
        errorColor: Colors.deepOrange,
        titleStyle: TextStyle(
          color: Colors.greenAccent,
          fontFamily: 'Poppins',
          letterSpacing: 4,
        ),
      )
    );
  }
}
