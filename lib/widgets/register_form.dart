import 'package:flutter/material.dart';
// import 'package:transport_expenses_tracker/services/auth_service.dart';

import '../services/auth_service.dart';

class RegisterForm extends StatefulWidget {

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  String? email;
  String? password;
  String? confirmPassword;

  var form = GlobalKey<FormState>();


  register() {
    bool isValid = form.currentState!.validate();

    if (isValid) {
      form.currentState!.save();

      if (password != confirmPassword) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password and Confirm Password does not match!'),));
      }

      AuthService authService = AuthService();

      return authService.register(email, password).then((value) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('User Registered successfully!'),));
        // Navigator.of(context).pushNamed('/readingnow');
      }).catchError((error) {
        FocusScope.of(context).unfocus();
        String message = error.toString().contains('] ') ? error.toString().split('] ')[1] : 'An error has occurred.';
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message),));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 10),
          Image.asset('images/logo_v1.1.jpg', height: 200),
          SizedBox(height: 100,),
          TextFormField(
            decoration: InputDecoration(label: Text('EMAIL', style: TextStyle(fontWeight: FontWeight.bold,
                fontFamily: "Lucida Bright", fontSize: 18, color: Color(0xFFCB997E)))),
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null)
                return "Please provide an email address.";
              else if (!value.contains('@'))
                return "Please provide a valid email address.";
              else
                return null;
            },
            onSaved: (value) {
              email = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('PASSWORD', style: TextStyle(fontWeight: FontWeight.bold,
                fontFamily: "Lucida Bright", fontSize: 18, color: Color(0xFFCB997E)))),
            obscureText: true,
            validator: (value) {
              if (value == null)
                return 'Please provide a password.';
              else if (value.length < 6)
                return 'Password must be at least 6 characters.';
              else
                return null;
            },
            onSaved: (value) {
              password = value;
            },
          ),
          TextFormField(
            decoration: InputDecoration(label: Text('CONFIRM PASSWORD', style: TextStyle(fontWeight: FontWeight.bold,
                fontFamily: "Lucida Bright", fontSize: 18, color: Color(0xFFCB997E)))),
            obscureText: true,
            validator: (value) {
              if (value == null)
                return 'Please provide a password.';
              else if (value.length < 6)
                return 'Password must be at least 6 characters.';
              else
                return null;
            },
            onSaved: (value) {
              confirmPassword = value;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: () { register(); }, child: Text('SIGN UP', style: TextStyle(fontWeight: FontWeight.bold,
              fontFamily: "Lucida Bright", fontSize: 20, color: Color(0xFFFFF1E6),
              letterSpacing: 8.0)),
              style:
              ElevatedButton.styleFrom(
                  shape: StadiumBorder(side: BorderSide(width: 1, color: Color(0xffA5A58D))),
                  minimumSize: Size(305, 47),
                  primary: Color(0xFFddbea9)
              )
          )
        ],
      ),
    );
  }
}
