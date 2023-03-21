// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class forgetpass extends StatefulWidget {
  forgetpass({
    Key? key,
  }) : super(key: key);

  @override
  State<forgetpass> createState() => _forgetpassState();
}

class _forgetpassState extends State<forgetpass> {
  bool value = false;
  // TextEditingController _email = TextEditingController();
  String? _email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Center(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromRGBO(255, 96, 0, 1),
                            fontFamily: 'Adagio Sans',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Container(
                      width: double.maxFinite,
                      child: Card(
                        color: Color.fromRGBO(238, 238, 238, 1),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Email',
                                    style: TextStyle(
                                        color: Color.fromRGBO(236, 103, 32, 1),
                                        fontSize: 16),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                child: TextFormField(
                                  onChanged: (ValueKey) {
                                    setState(() {
                                      _email = ValueKey;
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
                                  cursorColor: Color.fromRGBO(236, 103, 32, 1),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    // border: OutlineInputBorder(),
                                    // labelText: 'Email',
                                    hintText: 'Enter Email',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          new BorderSide(color: Colors.white),
                                      borderRadius:
                                          new BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                      child: InkWell(
                        onTap: (() async {
                          await resetpass(_email.toString());
                          await showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              //45064C
                              // backgroundColor: Color(0xFFF45064C),
                              title: Text('Forgot Password'),

                              content: Text(
                                  'Password rest link is Shared Sucessfully!'),

                              actions: [
                                TextButton(
                                  child: Text('Ok'),
                                  onPressed: () {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()));
                                  },
                                ),
                              ],
                            ),
                          );
                        }),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          // ignore: sort_child_properties_last
                          child: const Text(
                            "Get a Mail",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: "Adagio Sans",
                                color: Color.fromRGBO(255, 255, 255, 1)),
                          ),
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              // ignore: prefer_const_constructors
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                // ignore: prefer_const_literals_to_create_immutables
                                colors: [
                                  const Color.fromRGBO(236, 103, 32, 1),
                                  const Color.fromRGBO(195, 68, 0, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future resetpass(String email) async {
    try {
      return await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }
}
