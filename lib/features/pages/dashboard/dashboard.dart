import 'package:dhmsmobileapp/features/graphs/linechart.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/bloc/dashboardbloc_bloc.dart';
import 'package:dhmsmobileapp/features/pages/registerdevice/registerdevice.dart';
import 'package:dhmsmobileapp/features/pages/staffpage/staffregisterfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboardbloc_bloc.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  // @override
  // void initState() {
  //   print('loading state has started');
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    final DashboardblocBloc dashboardblocBloc = DashboardblocBloc();
    return BlocConsumer<DashboardblocBloc, DashboardblocState>(
      bloc: dashboardblocBloc,
      buildWhen: (previous, current) => current is! DashboardblocState,
      listenWhen: (previous, current) => current is DashboardblocState,
      listener: (context, state) {
        if (state is AddNewStaffState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const Staffregister();
              },
            ),
          );
        } else if (state is AddNewDeviceState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const registerdevice();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    'Welcome to your dashboard',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Get an overview of your device health and status',
                    style: TextStyle(fontFamily: 'Poppins'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton.icon(
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          dashboardblocBloc.add(AddNewStaffEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(225, 231, 252, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // icon: const Icon(Icons.upload),
                        label: const Text(
                          'Register a Staff',
                          style: TextStyle(
                            color: Color.fromRGBO(42, 102, 176, 1),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          dashboardblocBloc.add(AddNewDeviceEvent());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        icon: const Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        label: const Text(
                          'Register a Device',
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  // Device and profile data section
                  const SizedBox(
                    height: 50,
                  ),
                  // sections for devices and staff count starts here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Number of Devices section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(216, 218, 253, 1),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/dashdevices.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Devices',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 30,
                      ),

                      // Number of staff section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(231, 220, 250, 1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/dashstaff.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Staff',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // sections for devices and staff count ends here

                  const SizedBox(
                    height: 20,
                  ),

                  // Section for Departments and faulty devices starts here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // departments section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(210, 239, 241, 1),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/dashdept.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Departments',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 30,
                      ),

                      // Number of faulty devices section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(235, 87, 87, 0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/faultydevices.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Faulty devices',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Section for Departments and faulty devices ends here

                  const SizedBox(
                    height: 20,
                  ),

                  // Section for healthy devices and maintenance starts here
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // departments section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromRGBO(125, 242, 175, 0.3),
                              borderRadius: BorderRadius.circular(8)),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/healthydevices.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Healthy Devices',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(
                        width: 30,
                      ),

                      // Number of faulty devices section below
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(255, 231, 102, 0.3),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage(
                                    'assets/images/icons/maintenance.png'),
                              ),
                              Text(
                                '0',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'On maintenance',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  // Section for healthy devices and maintenance ends here

                  // Sectin for graph starts here

                  Container(
                    padding: const EdgeInsets.all(0),
                    child: const SizedBox(
                      height: 300,
                      child: LineGraph(),
                    ),
                  )

                  // Sectin for graph ends here
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
