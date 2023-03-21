// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_types_as_parameter_names, camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:quantumitapp/loginscreen/createpassword.dart';

class signupform extends StatefulWidget {
  signupform({Key? key}) : super(key: key);

  @override
  State<signupform> createState() => _signupformState();
}

class _signupformState extends State<signupform> {
  bool value = false;
  bool validator = true;
  String? _name, _address, _phonenumber, _email;
  // final TextEditingController _name = TextEditingController();
  // final TextEditingController _email = TextEditingController();
  // final TextEditingController _phonenumber = TextEditingController();
  // final TextEditingController _address = TextEditingController();
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Form(
            autovalidateMode: AutovalidateMode.always,
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Center(
                  child: Wrap(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
                          child: Text(
                            "Create an Account",
                            style: TextStyle(color: Colors.red, fontSize: 32),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: SizedBox(
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
                                        'Name',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                    child: TextFormField(
                                      onChanged: (ValueKey) {
                                        setState(() {
                                          _name = ValueKey;
                                        });
                                      },
                                      validator: ((value) {
                                        if (value == null || value.isEmpty) {
                                          validator = false;
                                          return 'Enter a valid User Name';
                                        } else {
                                          validator = true;
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Enter User Name',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Phone Number',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (ValueKey) {
                                        setState(() {
                                          _phonenumber = ValueKey;
                                        });
                                      },
                                      validator: ((value) {
                                        String pattern =
                                            r"(?:(?:\+|0{0,2})91(\s*[\ -]\s*)?|[0]?)?[789]\d{9}|(\d[ -]?){13}\d$";
                                        RegExp regex = RegExp(pattern);
                                        if (value == null ||
                                            value.isEmpty ||
                                            !regex.hasMatch(value)) {
                                          validator = false;
                                          return 'Enter a valid Mobile Number';
                                        } else {
                                          validator = true;
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor:
                                          Color.fromRGBO(236, 103, 32, 1),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Enter Mobile Number',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Email',
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
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
                                          validator = false;
                                          return 'Enter a valid email address';
                                        } else {
                                          validator = true;
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor:
                                          Color.fromRGBO(236, 103, 32, 1),
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Enter Email',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                            color:
                                                Color.fromRGBO(236, 103, 32, 1),
                                            fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 2, 10, 2),
                                    child: TextFormField(
                                      onChanged: (ValueKey) {
                                        setState(() {
                                          _address = ValueKey;
                                        });
                                      },
                                      validator: ((value) {
                                        if (value == null || value.isEmpty) {
                                          validator = false;
                                          return 'Enter a valid Address';
                                        } else {
                                          validator = true;
                                          return null;
                                        }
                                      }),

                                      // obscureText: true,
                                      cursorColor: Colors.red,
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Colors.white,
                                        // border: OutlineInputBorder(),
                                        // labelText: 'Email',
                                        hintText: 'Enter Address',
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: new BorderSide(
                                              color: Colors.white),
                                          borderRadius:
                                              new BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                activeColor: Colors.red,
                                                value: value,
                                                onChanged: (bool) {
                                                  setState(() {
                                                    value = !value;
                                                  });
                                                }),
                                            Text("I agree the "),
                                            Text(
                                              "Terms & Condition",
                                              style:
                                                  TextStyle(color: Colors.red),
                                            )
                                          ],
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                          onTap: (() {
                            Navigator.pop(context);
                          }),
                          child: Container(
                            // ignore: sort_child_properties_last
                            child: const Text(
                              'Already have an account? Login',
                              style: TextStyle(
                                  fontSize: 12, fontFamily: "Adagio Sans"),
                            ),
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 18, 0, 18),
                          child: InkWell(
                            onTap: (() {
                              if (value && validator) {
                                print(_name);
                                print(_phonenumber);
                                print(_email);
                                print(_address);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => createpassword(
                                      name: _name.toString(),
                                      email: _email.toString(),
                                      address: _address.toString(),
                                      phonenumber: _phonenumber.toString(),
                                    ),
                                  ),
                                );
                              }
                            }),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              alignment: Alignment.center,
                              // ignore: sort_child_properties_last
                              child: const Text(
                                "Get OTP",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: "Adagio Sans",
                                    color: Color.fromRGBO(255, 255, 255, 1)),
                              ),
                              width: 120,
                              height: 50,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
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
        ),
      ),
    );
  }
}
