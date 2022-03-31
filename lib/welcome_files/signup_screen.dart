import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'navigation_screen.dart';

class signup extends StatefulWidget {
  @override

  _State createState() => _State();
}

class _State extends State<signup> {
  ///controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController EmailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirm = TextEditingController();

  ///nodes
  final FocusNode _emailFocus = FocusNode();
  final FocusNode _firstNameFocus = FocusNode();
  final FocusNode _lastNameFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();
  final FocusNode _confirmPasswordFocus = FocusNode();
  String _errorMessage = '';
  void processError(final PlatformException error) {
    setState(() {
      _errorMessage = error.message!;
    });
  }
  bool _isObscure = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5181b8),
        title: Center(
          child: Text('Register',
            style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Color(0xffffffff
              ),
            ),
          ),
        ),
        toolbarHeight: 200,
        shape:  RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(60),
          ),
        ),
      ),
      body: Center(
        child: Container(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ///name
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            onChanged: (String value) {},
                            validator: (value){
                              if(value!.isEmpty){
                                return 'input your name please!';
                              }
                              return null;
                            },
                            controller: nameController,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Color(0xff2a5885),
                                ),
                                fillColor: Color(0xffedeef0),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1.4),
                                    borderRadius: BorderRadius.circular(15.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.4, color: Color(0xff4a76a8),),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'EGY TOUR',
                                labelText: 'Name',
                                labelStyle: TextStyle(
                                  color: Color(0xff2a5885),
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        ///password
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                         child: TextFormField(
                           validator: (value) {
                             if (value!.length< 8) {
                               return 'Password must be longer than 8 characters.';
                             }
                             return null;
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
                                    width: 1.4, color: Color(0xff4a76a8),),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color(0xff2a5885),
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ///password confirm
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          child: TextFormField(
                            validator: (value) {
                              if (passwordController.text.length > 8 &&
                                  passwordConfirm.text != value) {
                                return 'Passwords do not match.';
                              }
                              return null;
                            },
                            focusNode: _passwordFocus,
                            onFieldSubmitted: (term) {
                              FocusScope.of(context)
                                  .requestFocus(_confirmPasswordFocus);
                            },
                            keyboardType: TextInputType.visiblePassword,
                            controller: passwordConfirm,
                            decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Color(0xff2a5885),
                                ),
                                fillColor: Color(0xffedeef0),
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: const BorderSide(width: 1.4),
                                    borderRadius: BorderRadius.circular(15.0)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    width: 1.4, color: Color(0xff4a76a8),),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                labelText: 'Password',
                                labelStyle: TextStyle(
                                  color: Color(0xff2a5885),
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ///email
                        Container(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            onChanged: (String value) {},
                            validator: (value){
                              if(value!.isEmpty|| !value.contains('@')){
                                return 'email address can not be empty';
                              }
                              return null;
                            },
                            autofocus: false,
                            focusNode: _firstNameFocus,
                            onFieldSubmitted: (term) {
                              FocusScope.of(context).requestFocus(_firstNameFocus);
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
                                    width: 1.4, color: Color(0xff4a76a8),),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                hintText: 'example@egytrour.eg',
                                labelText: 'Email',
                                labelStyle: TextStyle(
                                  color: Color(0xff2a5885),
                                  fontSize: 18,
                                )),
                          ),
                        ),
                        const SizedBox(height: 10),
                        ///creat button
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: MaterialButton(
                              height: 45,
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(15.0)),
                              color: Color(0xff4a76a8),
                              onPressed: () {
                                var formKey;
                                // if (formKey.currentState.validate()) {
                                //   _firebaseAuth
                                //       .createUserWithEmailAndPassword(
                                //       email: EmailController.text,
                                //       password: passwordController.text)
                                //       .then((onValue) {FirebaseFirestore.instance.collection('users')
                                //         .document(onValue.uid)
                                //         .setData({
                                //       'Name': nameController.text,
                                //     }).then((userInfoValue) {
                                //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Navigationbar()));
                                //     });
                                //   }).catchError((onError) {
                                //     processError(onError);
                                //   });
                                // }
                              },
                              child: Text(
                                'Creat account',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Already have an account?',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16)),
                            TextButton(
                                onPressed: () {
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()),
                                  );
                                },
                                child: Text('login',
                                    style: TextStyle(
                                      color: Color(0xff2a5885),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )))
                          ],
                        ),
                        Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(20),
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
                  ),
                ))),
      ),
    );
  }
}
