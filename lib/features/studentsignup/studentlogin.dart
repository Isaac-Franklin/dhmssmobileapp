// ignore_for_file: prefer_const_constructors

import 'package:dhmsmobileapp/features/pages/dashboard/dashboard.dart';
import 'package:dhmsmobileapp/features/studentsignup/bloc/studentonboarding_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentLogin extends StatefulWidget {
  const StudentLogin({super.key});

  @override
  State<StudentLogin> createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isButtonEnabled = false;
  bool _ischecked = false;
  final _formKey = GlobalKey<FormState>();

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _ischecked = value ?? false;
      // _checkForm();
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_checkForm);
    _emailController.addListener(_checkForm);
  }

  void _checkForm() {
    setState(() {
      _isButtonEnabled = _passwordController.text.isNotEmpty &&
          _emailController.text.isNotEmpty;
      // _ischecked;
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      return context.read<StudentonboardingBloc>().add(
            LoginButtonPressed(
              student_email: _emailController.text,
              student_password: _passwordController.text,
            ),
          );
      // print('Login Form submitted successfully!');
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Color.fromRGBO(66, 133, 244, 1),
          size: 30,
        ),
      ),

      // body
      body: BlocListener<StudentonboardingBloc, StudentonboardingState>(
        listener: (context, state) {
          if (state is StudentLoginLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Image(
                        image: AssetImage('assets/images/dhms.png'),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CircularProgressIndicator()
                    ],
                  ),
                );
              },
            );
          }
          if (state is StudentLoginSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return Dashboard();
                },
              ),
            );
          }
          if (state is StudentLoginFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Login Failed'),
                  content: Text(state.error),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StudentLogin();
                            },
                          ),
                        );
                        // Navigator.of(context).pop();
                      },
                      child: Text('Try Again'),
                    ),
                  ],
                );
              },
            );
          }
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 0,
                  ),
                  Row(
                    children: const [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        width: 30,
                        image: AssetImage('assets/images/wavinghand.png'),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "We've missed you! Log in to your account",
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),

                  // email field
                  Text(
                    'Email Address',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // TextFormField()
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email address';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromRGBO(242, 245, 250, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: "Kindly enter your email address",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(104, 104, 104, 1),
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),

                  // School name
                  SizedBox(
                    height: 5,
                  ),
                  // Password

                  Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  // TextFormField()
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      // label: Text("What's your name?"),
                      filled: true,
                      fillColor: Color.fromRGBO(242, 245, 250, 1),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      hintText: "Kindly enter your password",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(104, 104, 104, 1),
                        fontFamily: 'Nunito',
                      ),
                      suffixIcon: Icon(
                        CupertinoIcons.eye,
                        // CupertinoIcons.eye_slash,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // remember password and forgot password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: _ischecked,
                              onChanged: (bool? value) {
                                _onCheckboxChanged(value);
                              }),
                          Text(
                            'Remember me',
                            style: TextStyle(
                              fontFamily: 'Nunito',
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forget password',
                          style: TextStyle(
                            fontFamily: 'Nunito',
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Buttons
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: _isButtonEnabled
                            ? Color.fromRGBO(66, 133, 244, 1)
                            : Color.fromRGBO(225, 231, 252, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: _isButtonEnabled ? _submitForm : null,
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Nunito',
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
