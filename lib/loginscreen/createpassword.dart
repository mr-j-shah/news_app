// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, camel_case_types, must_be_immutable, unused_import

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:quantumitapp/homepage.dart';

import 'login.dart';

class createpassword extends StatefulWidget {
  String name;
  String email, phonenumber, address;
  createpassword(
      {Key? key,
      required this.name,
      required this.email,
      required this.phonenumber,
      required this.address})
      : super(key: key);

  @override
  State<createpassword> createState() => _createpasswordState();
}

class _createpasswordState extends State<createpassword> {
  bool value = false;
  final TextEditingController _passwordOne = TextEditingController();
  final TextEditingController _passwordTwo = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Center(
            child: Form(
              child: Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Create Password",
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
                                    'Password',
                                    style: TextStyle(
                                        color: Color.fromRGBO(236, 103, 32, 1),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: 31,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 2, 10, 2),
                                      child: TextFormField(
                                        validator: ((value) {
                                          RegExp regex = RegExp(
                                              r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                                          if (value!.isEmpty &&
                                              value.length > 6 &&
                                              !regex.hasMatch(value)) {
                                            return "It's not Empty or Less than 4";
                                          } else {}
                                        }),
                                        controller: _passwordOne,
                                        obscureText: true,
                                        cursorColor:
                                            Color.fromRGBO(236, 103, 32, 1),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Confirm Password',
                                    style: TextStyle(
                                        color: Color.fromRGBO(236, 103, 32, 1),
                                        fontSize: 14),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: 31,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        validator: ((value) {
                                          RegExp regex = RegExp(
                                              r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#\$&*~]).{8,}$');
                                          if (value!.isEmpty &&
                                              value.length > 6 &&
                                              // ignore: unrelated_type_equality_checks
                                              !regex.hasMatch(value) &&
                                              value == _passwordOne) {
                                            return "Please Enter Correct Password";
                                          } else {}
                                        }),
                                        obscureText: true,
                                        controller: _passwordTwo,
                                        cursorColor:
                                            Color.fromRGBO(236, 103, 32, 1),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
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
                          await createuser();
                        }),
                        child: Container(
                          padding: EdgeInsets.all(8),
                          alignment: Alignment.center,
                          // ignore: sort_child_properties_last
                          child: const Text(
                            "Create",
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

  Future<void> createuser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: widget.email, password: _passwordOne.text);
      if (userCredential != null) {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Registration'),
            content: Text('You have Sucessfully Registered'),
            actions: [
              TextButton(
                child: Text('Ok'),
                onPressed: () async {
                  var result = await add(converter(widget.name, widget.address,
                      widget.phonenumber, widget.email, _passwordOne.text));
                  if (result == true) {
                    print("Done");
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => homepage()));
                  }
                },
              ),
            ],
          ),
        );
      }
      ;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            //45064C
            // backgroundColor: Color(0xFFF45064C),
            title: Text('Registration'),
            content: Text('User already Exist'),
            actions: [
              TextButton(
                  child: Text('Ok'),
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => login()));
                  }),
            ],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> add(Map<String, dynamic> u) async {
    final response = await http.post(
        Uri.parse('https://washim.aquaakshara.in/api/add_customer.php'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(u));

    print(response.body);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("Success");
      return true;
    } else {
      print("Fail");
      return false;
    }
  }

  Map<String, dynamic> converter(
      String name, String address, String mobile, String email, String pass) {
    Map<String, dynamic> user = {
      'name': name,
      'address': address,
      'mobileno': mobile,
      'email': email,
      'password': pass
    };
    return user;
  }
}
