import 'package:dhmsmobileapp/features/onboardingflow/usertypelist.dart';
import 'package:dhmsmobileapp/features/studentsignup/studentsignup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SelectUserType extends StatelessWidget {
  const SelectUserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(243, 243, 243, 1),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),

                // Title
                const Text(
                  'Select your user type',
                  style: TextStyle(
                    fontFamily: 'Nunito',
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                // Corporate DHMS
                GestureDetector(
                  onTap: () {},
                  child: const UserTypeSegment(
                    userImage: Image(
                      width: 120,
                      image: AssetImage('assets/images/corporatedhms.png'),
                    ),
                    userSegmentTitle: 'Corporate DHMS',
                    userSegmentSubtitle:
                        "Manage your company's devices effectively",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return StudentSignUp();
                        },
                      ),
                    );
                  },
                  child: const UserTypeSegment(
                    userImage: Image(
                      width: 120,
                      image: AssetImage('assets/images/studentdhms.png'),
                    ),
                    userSegmentTitle: 'Student DHMS',
                    userSegmentSubtitle:
                        "Manage your study devices effortlessly",
                  ),
                ),

                const SizedBox(
                  height: 30,
                ),

                GestureDetector(
                  onTap: () {},
                  child: const UserTypeSegment(
                    userImage: Image(
                      width: 120,
                      image: AssetImage('assets/images/familydhms.png'),
                    ),
                    userSegmentTitle: 'Family DHMS',
                    userSegmentSubtitle:
                        "Keep your family's devices secure and up-to-date.",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {},
                  child: const UserTypeSegment(
                    userImage: Image(
                      width: 120,
                      image: AssetImage('assets/images/techsupportdhms.png'),
                    ),
                    userSegmentTitle: 'Tech Support',
                    userSegmentSubtitle:
                        "Provide expert assistance for all device-related issues.",
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
  }
}
