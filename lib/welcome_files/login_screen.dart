import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'navigation_screen.dart';
import 'signup_screen.dart';

class login extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<login> {
  // final AuthServices _authServices = AuthServices();

  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  String email = '';
  String password = '';
  bool _isObscure = true;
  String _errorMessage = '';
  void onChange() {
    setState(() {
      _errorMessage = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    EmailController.addListener(onChange);
    passwordController.addListener(onChange);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5181b8),
        title: Center(
          child: Text(
            'Login',
            style: TextStyle(
              fontFamily: 'Roboto',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color(0xffffffff),
            ),
          ),
        ),
        toolbarHeight: 200,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10, top: 40),
            child: Form(
              key: formKey,
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),

                  ///email
                  TextFormField(
                    onChanged: (String value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty || !value.contains('@')) {
                        return 'email address can not be empty';
                      }
                      return null;
                    },
                    controller: EmailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Color(0xff2a5885),
                        ),
                        fillColor: Color(0xffedeef0),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1.4),
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.4,
                            color: Color(0xff4a76a8),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'example@egytrour.eg',
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: Color(0xff2a5885),
                          fontSize: 18,
                        )),
                    onEditingComplete: () => node.nextFocus(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ///password
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'password can not be empty';
                      }
                      return null;
                    },
                    onFieldSubmitted: (v) {
                      FocusScope.of(context).requestFocus(node);
                    },
                    obscureText: _isObscure,
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Color(0xff2a5885),
                        ),
                        suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility
                                : Icons.visibility_off),
                            color: Color(0xff2a5885),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            }),
                        fillColor: Color(0xffedeef0),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: const BorderSide(width: 1.4),
                            borderRadius: BorderRadius.circular(15.0)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.4,
                            color: Color(0xff4a76a8),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: Color(0xff2a5885),
                          fontSize: 18,
                        )),
                  ),
                  const SizedBox(height: 10),

                  ///for the forgot password text
                  GestureDetector(
                      child: Text("  Forgot Password",
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff2a5885),
                          )),
                      onTap: () {
                        // do what you need to do when "Click here" gets clicked
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => signup()),
                        );
                      }),
                  const SizedBox(height: 10),

                  ///login button
                  MaterialButton(
                    height: 45,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(15.0)),
                    color: Color(0xff4a76a8),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Navigationbar()),
                        );
                      }
                      // if (formKey.currentState!.validate()) {signIn(EmailController.text, passwordController.text)
                      //       .then((uid) => {
                      //   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigationbar()),),
                      //   })
                      //       .catchError((error) => {processError(error)});
                      // }
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),

                  ///for text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?',
                          style: TextStyle(
                              color: Colors.grey.withOpacity(0.9),
                              fontWeight: FontWeight.bold,
                              fontSize: 16)),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => signup()));
                          },
                          child: const Text(
                            'Register',
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff2a5885)),
                          )),
                    ],
                  ),
                  Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          SignInButton(
                            Buttons.Google,
                            onPressed: () {},
                          ),
                        ],
                      )),
                ],
              ),
            )),
      ),
    );
  }

  void processError(final PlatformException error) {
    if (error.code == "ERROR_USER_NOT_FOUND") {
      setState(() {
        _errorMessage = "Unable to find user. Please register.";
      });
    } else if (error.code == "ERROR_WRONG_PASSWORD") {
      setState(() {
        _errorMessage = "Incorrect password.";
      });
    } else {
      setState(() {
        _errorMessage =
            "There was an error logging in. Please try again later.";
      });
    }
  }
}
