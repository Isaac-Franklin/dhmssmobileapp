// ignore_for_file: prefer_const_constructors

import 'package:dhmsmobileapp/features/studentsignup/bloc/studentonboarding_bloc.dart';
import 'package:dhmsmobileapp/features/studentsignup/studentlogin.dart';
import 'package:dhmsmobileapp/utils/api_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => StudentonboardingBloc(ApiClient()),
        child: StudentSignUp(),
      ),
    );
  }
}

class StudentSignUp extends StatefulWidget {
  StudentSignUp({super.key});

  @override
  State<StudentSignUp> createState() => _StudentSignUpState();
}

class _StudentSignUpState extends State<StudentSignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _studentphoneController = TextEditingController();

  final TextEditingController _studentnameController = TextEditingController();

  final TextEditingController _schoolnameController = TextEditingController();

  bool _ischecked = false;

  // bool _regFormResponse;

  bool _isButtonEnabled = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _ischecked = value ?? false;
      _checkForm();
    });
  }

  @override
  void initState() {
    super.initState();
    _studentphoneController.addListener(_checkForm);
    _passwordController.addListener(_checkForm);
    _emailController.addListener(_checkForm);
    _studentnameController.addListener(_checkForm);
    _schoolnameController.addListener(_checkForm);
  }

  void _checkForm() {
    setState(() {
      _isButtonEnabled = _studentphoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _studentnameController.text.isNotEmpty &&
          _schoolnameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _ischecked;
    });
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      return context.read<StudentonboardingBloc>().add(
            SignupButtonPressed(
              // context BuildContext: context,
              student_email: _emailController.text,
              student_name: _studentnameController.text,
              student_password: _passwordController.text,
              student_school: _schoolnameController.text,
              student_phone: _studentphoneController.text,
            ),
          );
    }
  }

  @override
  void dispose() {
    _studentphoneController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _studentnameController.dispose();
    _schoolnameController.dispose();
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
          if (state is StudentSignupLoading) {
            showDialog(
              context: context,
              builder: (context) {
                return Column(
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
                );
              },
            );
          }
          if (state is StudentSignupFailure) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Signup Failed'),
                  content: Text(state.error),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return StudentSignUp();
                        }));
                        // Navigator.of(context).pop();
                      },
                      child: Text('Try Again'),
                    ),
                  ],
                );
              },
            );
          }
          if (state is StudentSignupSuccess) {
            // context
            //     .read<StudentonboardingBloc>()
            //     .add(StudentSignupSuccessEvent());

            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) {
            //   return ExistingStudentLogin();
            // }));
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
                  const Text(
                    'Sign up',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome! lets help you keep their devices running smoothly. ',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // Student name
                  Text(
                    'Student Name',
                    style: TextStyle(
                      fontFamily: 'Nunito',
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    controller: _studentnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your full name';
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
                      hintText: "What's your name?",
                      hintStyle: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(104, 104, 104, 1),
                        fontFamily: 'Nunito',
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),

                  // student user name
                  Text(
                    'Phone Number',
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
                    controller: _studentphoneController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
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
                      hintText: "Enter your phone number?",
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
                      if (!value.contains('@')) {
                        return 'Please enter a valid email address';
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
                      hintText: "What's your email address?",
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

                  Text(
                    'School Name',
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
                    controller: _schoolnameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your school name';
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
                      hintText: "What's the name of your school?",
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
                    // enabled: ,
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      // if (value.length < 6) {
                      //   return 'Password must be at least 6 characters long';
                      // }
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
                      hintText: "Create password",
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

                  // terms of service
                  Row(
                    children: [
                      Checkbox(
                          value: _ischecked,
                          onChanged: (bool? value) {
                            _onCheckboxChanged(value);
                          }),
                      Text(
                        'I agree to terms and conditions',
                        style: TextStyle(
                          fontFamily: 'Nunito',
                          fontSize: 14,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
                        'Create Account',
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
                  Center(
                    child: Text(
                      'Or',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: 24,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 1),
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        backgroundColor: Color.fromRGBO(225, 231, 252, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Image(
                            width: 30,
                            // opacity: ,
                            image: AssetImage('assets/images/googlelogo.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Signup with Google',
                            style: TextStyle(
                              color: Color.fromRGBO(66, 133, 244, 1),
                              fontFamily: 'Nunito',
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return StudentLogin();
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Have an account already? Click to login',
                        style: TextStyle(
                          color: Color.fromRGBO(66, 133, 244, 1),
                          fontFamily: 'Nunito',
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   FailedSignupPopUp() {
//     return showModalBottomSheet(
//       context: context,
//       builder: (BuildContext context) {
//         return SizedBox(
//           child: Center(
//             child: Column(
//               children: [
//                 Text('An error occured while trying to signup'),
//                 Text(''),
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   child: Text('Try Again'),
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
}
