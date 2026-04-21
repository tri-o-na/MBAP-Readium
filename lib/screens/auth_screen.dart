import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../widgets/login_form.dart';
import '../widgets/register_form.dart';

class AuthScreen extends StatefulWidget {
  static String routeName = '/auth';

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthService authService = AuthService();

  bool loginScreen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text('Readium',
      //     style: TextStyle(fontFamily: "Caladea", fontSize: 26),
      //   ),
      //   backgroundColor: Color(0xFFddbea9),
      // ),
      body: Container(
          color: Color(0xFFfff1e6),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              loginScreen ? LoginForm() : RegisterForm(),
              SizedBox(height: 5),
              loginScreen ? TextButton(onPressed: () {
                setState(() {
                  loginScreen = false;
                });
              }, child: Text('Sign Up here', style: TextStyle(fontWeight: FontWeight.bold,
                  fontFamily: "Lucida Bright", fontSize: 17, color: Color(0xffA5A58D), decoration: TextDecoration.underline))) :
              TextButton(onPressed: () {
                setState(() {
                  loginScreen = true;
                });
              }, child: Text('Login here', style: TextStyle(fontWeight: FontWeight.bold,
                  fontFamily: "Lucida Bright", fontSize: 17, color: Color(0xffA5A58D), decoration: TextDecoration.underline))),
              // loginScreen ? TextButton(onPressed: () {
              //   Navigator.of(context).pushNamed(ResetPasswordScreen.routeName);
              // }, child: Text('Forgotten Password')) : Center()
            ],
          )
      ),
    );
  }
}
