import 'package:flutter/material.dart';
import 'package:readium_v1/widgets/app_drawer.dart';

import '../main.dart';
import '../services/auth_service.dart';
import '../widgets/search_page.dart';

class AccountDetails extends StatefulWidget {
  static String routeName = '/accountdetails';
  // TextEditingController _textEditingControllerUsername = TextEditingController(text: "jane123");
  // TextEditingController _textEditingControllerPassword = TextEditingController(text: "jane123");
  // TextEditingController _textEditingControllerEmail = TextEditingController(text: "jane123@gmail.com");



  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  AuthService authService = AuthService();
  logOut(BuildContext context) {
    return authService.logOut().then((value) {
      FocusScope.of(context).unfocus();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Logout successfully!'),));
      Navigator.of(context).pushNamed('/');

    }).catchError((error) {
      FocusScope.of(context).unfocus();
      String message = error.toString();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:
      Text(message),));
    });
  }
  //
  // String username = "jane123";
  // String password = "jane123";
  // String email = "jane123@gmail.com";


  // List<Book> myBooks;
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text('Account', style: TextStyle(fontFamily: "Caladea", fontSize: 26),),
          backgroundColor: Color(0xFFddbea9),
          actions: [
            IconButton(onPressed: (
                )=> logOut(context), icon: Icon(Icons.logout))
          ],
        ),
        body: SingleChildScrollView(
          child: Container(
            color: Color(0xFFfff1e6),
              padding: EdgeInsets.fromLTRB(43, 50, 42, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                    foregroundImage: AssetImage('images/default3.jpg'),
                    maxRadius: 80,
                ),
                SizedBox(height: 15,),
                SizedBox( //to control the width of the text form field
                  width: 306,
                  child: TextFormField( //text form field for username
                      controller: TextEditingController(text: "jane123"),
                      // initialValue: username,
                      // TextEditingController(text: "jane123"),
                      cursorColor: Color(0xffA5A58D),
                      style: TextStyle(fontFamily: "Caladea",
                        fontSize: 21, color: Color(0xffCB997E),),
                      decoration: InputDecoration( //style of text field
                        labelText: "Username", //babel text
                        labelStyle: TextStyle(fontFamily: "Caladea",
                          fontSize: 20, color: Color(0xffCB997E), //label style
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                      ),
                      // validator: (value) {
                      //   if (value == null)
                      //     return "Please provide a username.";
                      //   else if (value.length < 5)
                      //     return 'Please enter a username that is at least 5 characters.';
                      //   else
                      //     return null;
                      // }
                  ),
                ),
                SizedBox(height: 25,),
                SizedBox(//to control the width of the text form field
                  width: 306,
                  child: TextFormField( //text form field for password
                      obscureText: true,
                      controller: TextEditingController(text: "jane123",),
                      // initialValue: password,
                      // controller: TextEditingController(text: "jane123"),
                      cursorColor: Color(0xffA5A58D),
                      style: TextStyle(fontFamily: "Caladea",
                      fontSize: 21, color: Color(0xffCB997E),),
                      decoration: InputDecoration(//style of text field
                        labelText: "Password", //babel text
                        labelStyle: TextStyle(fontFamily: "Caladea",
                          fontSize: 20, color: Color(0xffCB997E), //label style
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                      ),
                      // validator: (value) {
                      //   if (value == null)
                      //     return "Please provide a password.";
                      //   else if (value.length < 5)
                      //     return 'Please enter a review that is at least 8 characters.';
                      //   else if (value.length >= 20)
                      //     return 'Please enter a review that is at most 20 characters.';
                      //   else
                      //     return null;
                      // }
                  ),
                ),
              SizedBox(height: 25,),
              SizedBox(//to control the width of the text form field
                width: 306,
                child: TextFormField( //text form field for email
                      controller:  TextEditingController(text: "jane123@gmail.com"),
                      // initialValue: email,
                      // controller: TextEditingController(text: "jane123@gmail.com"),
                      // keyboardType: TextInputType.emailAddress,
                      cursorColor: Color(0xffA5A58D),
                      style: TextStyle(fontFamily: "Caladea", fontSize: 21, color: Color(0xffCB997E),),
                      decoration: InputDecoration( //style of text field
                        labelText: "Email",
                        labelStyle: TextStyle(fontFamily: "Caladea",
                          fontSize: 20, color: Color(0xffCB997E), //label style
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffA5A58D)),
                        ),
                      ),
                      // validator: (value) {
                      //   if (value == null)
                      //     return "Please provide a email.";
                      //   else
                      //     return null;
                      // }
                  ),
                ),
                SizedBox(height: 40),
                ElevatedButton( //button to edit account
                    onPressed: () => {
                    // setState(() {
                    //   widget._textEditingControllerUsername.text;
                    //   widget._textEditingControllerPassword.text;
                    //   widget._textEditingControllerEmail.text;
                    //   })
                    },
                    child: Text('EDIT', style: TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: "Lucida Bright", fontSize: 20, color: Color(0xFFFFF1E6),
                        letterSpacing: 8.0)),
                    style:
                    ElevatedButton.styleFrom(
                        shape: StadiumBorder(side: BorderSide(width: 1, color: Color(0xffA5A58D))),
                        minimumSize: Size(305, 47),
                        primary: Color(0xFFddbea9)
                    )
                ),
                SizedBox(height: 20),
                ElevatedButton( //button to delete account, goes back to main screen
                    onPressed: () => {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainScreen()))
                    },
                    child: Text('DELETE', style: TextStyle(fontWeight: FontWeight.bold,
                        fontFamily: "Lucida Bright", fontSize: 20, color: Color(0xFFFFF1E6),
                        letterSpacing: 8.0)),
                    style:
                    ElevatedButton.styleFrom(
                        shape: StadiumBorder(side: BorderSide(width: 1, color: Color(0xffA5A58D))),
                        minimumSize: Size(305, 47),
                        primary: Color(0xFFddbea9)
                    )),

              ],
            )
      ),
        ),
      drawer: AppDrawer(), //navigate between pages via app drawer
    );
  }
}
// if (widget._textEditingControllerUsername.text.length > 5
// && widget._textEditingControllerPassword.text.length >= 8
// && widget._textEditingControllerPassword.text.length <= 20
// && widget._textEditingControllerEmail.text != null) {
// print(widget._textEditingControllerUsername.text),
// print(widget._textEditingControllerPassword.text),
// print(widget._textEditingControllerEmail.text),
// }
// else{
//   print('invalid')
// }
