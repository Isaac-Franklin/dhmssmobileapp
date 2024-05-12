import 'package:dhmsmobileapp/features/pages/dashboard/dashboard.dart';
import 'package:dhmsmobileapp/features/pages/staffpage/bloc/staffreg_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Staffregister extends StatefulWidget {
  const Staffregister({super.key});

  @override
  State<Staffregister> createState() => _StaffregisterState();
}

class _StaffregisterState extends State<Staffregister> {
  @override
  void initState() {
    staffregBloc.add(StartActionState());
    super.initState();
  }

  final StaffregBloc staffregBloc = StaffregBloc();

  @override
  Widget build(BuildContext context) {
    // final StaffregBloc staffregBloc = StaffregBloc();
    return BlocConsumer<StaffregBloc, StaffregState>(
      bloc: staffregBloc,
      buildWhen: (previous, current) => current is StaffregState,
      listenWhen: (previous, current) => current is StaffregState,
      listener: (context, state) {
        if (state is Navigatetohomepage) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Dashboard();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case StaffPageLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case StaffPageSuccessLoadingState:
            final successstate = state as StaffPageSuccessLoadingState;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Register a new staff'),
              ),
              body: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontFamily: 'Poppin',
                            color: Colors.blue[300],
                            fontSize: 30,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // Subtext
                        const Text(
                          'Please Choose Account Type',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),

                        //  account options buttons
                        SizedBox(
                          height: 50,
                          child: Container(
                            margin: const EdgeInsets.only(right: 30, left: 30),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                50,
                              ),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                      ),
                                      elevation: 0,
                                      maximumSize: const Size.fromHeight(50),
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const Text(
                                      'Patient',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: const RoundedRectangleBorder(
                                        //to set border radius to button
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(30),
                                          bottomRight: Radius.circular(30),
                                        ),
                                      ),
                                      elevation: 0,
                                      backgroundColor: Colors.white,
                                    ),
                                    onPressed: null,
                                    child: const Text(
                                      'Doctor',
                                      style: TextStyle(
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          default:
            return const Text('An error occured again');
        }
      },
    );
  }
}
