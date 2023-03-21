// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, camel_case_types

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quantumitapp/homepage.dart';

import 'forgotpassword.dart';
import 'signup.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text(
          "SocialX",
          style: TextStyle(color: Colors.white, fontSize: 28),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: isLoading
            ? CircularProgressIndicator(
                color: Colors.red,
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(75, 0, 75, 0),
                          child: Wrap(
                            children: [
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                  child: Text(
                                    "Signin into Your Account",
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 32),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 240,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            238, 238, 238, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      onChanged: (ValueKey) {
                                        setState(() {
                                          _email.text = ValueKey;
                                        });
                                      },
                                      validator: ((value) {
                                        String pattern =
                                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                                            r"{0,253}[a-zA-Z0-9])?)*$";
                                        RegExp regex = RegExp(pattern);
                                        if (value == null ||
                                            value.isEmpty ||
                                            !regex.hasMatch(value)) {
                                          return 'Enter a valid email address';
                                        } else {
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            238, 238, 238, 1),
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Email',
                                        hintStyle: TextStyle(color: Colors.red),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: const Color.fromRGBO(
                                                  238, 238, 238, 1)),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: const Color.fromRGBO(
                                                  238, 238, 238, 1)),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 18),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    width: 240,
                                    height: 60,
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            238, 238, 238, 1),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: TextFormField(
                                      obscureText: true,
                                      onChanged: (ValueKey) {
                                        setState(() {
                                          _password.text = ValueKey;
                                        });
                                      },
                                      validator: ((value) {
                                        // String pattern =
                                        //     r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$';
                                        // RegExp regex = RegExp(pattern);
                                        if (value == null || value.isEmpty) {
                                          return 'Enter a Password';
                                        } else {
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: const Color.fromRGBO(
                                            238, 238, 238, 1),
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Password',
                                        hintStyle: TextStyle(color: Colors.red),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: const Color.fromRGBO(
                                                  238, 238, 238, 1)),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: const Color.fromRGBO(
                                                  238, 238, 238, 1)),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: (() {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                forgetpass()));
                                  }),
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: const Text(
                                      'Forgot Password?',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontFamily: "Adagio Sans"),
                                    ),
                                  )),
                              Center(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 18, 0, 18),
                                  child: InkWell(
                                    onTap: (() async {
                                      try {
                                        UserCredential userCredential =
                                            await FirebaseAuth.instance
                                                .signInWithEmailAndPassword(
                                                    email: _email.text,
                                                    password: _password.text);
                                        if (userCredential != null) {
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      homepage()));
                                        }
                                      } on FirebaseAuthException catch (e) {
                                        if (e.code == 'user-not-found') {
                                          await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              //45064C
                                              // backgroundColor: Color(0xFFF45064C),
                                              title: Text(
                                                  'You have not registered yet'),
                                              content:
                                                  Text('Please register first'),
                                              actions: [
                                                TextButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                signupform()));
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        } else if (e.code == 'wrong-password') {
                                          await showDialog(
                                            context: context,
                                            builder: (context) => AlertDialog(
                                              //45064C
                                              // backgroundColor: Color(0xFFF45064C),
                                              title: Text('Error'),
                                              content:
                                                  Text('Enter Password Again!'),
                                              actions: [
                                                TextButton(
                                                  child: Text('Ok'),
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                                TextButton(
                                                  child:
                                                      Text('Forgot Password'),
                                                  onPressed: () {
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                forgetpass()));
                                                  },
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      }
                                    }),
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 240,
                                      height: 60,
                                      decoration: BoxDecoration(
                                          // ignore: prefer_const_constructors
                                          gradient: LinearGradient(
                                            begin: Alignment.topCenter,
                                            end: Alignment.bottomCenter,
                                            colors: [
                                              const Color.fromRGBO(
                                                  236, 103, 32, 1),
                                              const Color.fromRGBO(
                                                  195, 68, 0, 1),
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        "Log in",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontFamily: "Adagio Sans",
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1)),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: InkWell(
                                      onTap: (() {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    signupform()));
                                      }),
                                      child: Container(
                                        alignment: Alignment.topCenter,
                                        child: const Text(
                                          'Don\'t have an Account?Sign up',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: "Adagio Sans"),
                                        ),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
                                  alignment: Alignment.topCenter,
                                  child: const Text(
                                    'or',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: "Adagio Sans"),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          15, 5, 20, 5),
                                      child: IconButton(
                                        onPressed: (() {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          googlelogin();
                                        }),
                                        icon: const Icon(
                                            FontAwesomeIcons.google,
                                            color: Colors.grey,
                                            size: 40.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
      ),
    );
  }

  googlelogin() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    await signInWithGoogle();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => homepage(),
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
