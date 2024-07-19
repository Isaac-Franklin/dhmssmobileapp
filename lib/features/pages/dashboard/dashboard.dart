import 'package:dhmsmobileapp/features/graphs/linechart.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/bloc/dashboardbloc_bloc.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/widgets/chatsectionview.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/widgets/devicesectionview.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/widgets/homesectionview.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/widgets/maintenancesectionview.dart';
import 'package:dhmsmobileapp/features/pages/dashboard/widgets/reportsectionview.dart';
import 'package:dhmsmobileapp/features/pages/registerdevice/registerdevice.dart';
import 'package:dhmsmobileapp/features/pages/staffpage/staffregisterfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/dashboardbloc_bloc.dart';

class MyDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => DashboardblocBloc(),
        child: const Dashboard(),
      ),
    );
  }
}

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        context.read<DashboardblocBloc>().add(DashboardScreenActiveEvent());
      } else if (_selectedIndex == 1) {
        context.read<DashboardblocBloc>().add(DevicesScreenActiveEvent());
      } else if (_selectedIndex == 2) {
        context.read<DashboardblocBloc>().add(ChatScreenActiveEvent());
      } else if (_selectedIndex == 3) {
        context.read<DashboardblocBloc>().add(MaintenanceScreenActiveEvent());
      } else if (_selectedIndex == 4) {
        context.read<DashboardblocBloc>().add(ReportScreenActiveEvent());
      } else {
        context.read<DashboardblocBloc>().add(DashboardScreenActiveEvent());
      }
      print(_selectedIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    final DashboardblocBloc dashboardblocBloc = DashboardblocBloc();
    return BlocConsumer<DashboardblocBloc, DashboardblocState>(
      // bloc: dashboardblocBloc,
      buildWhen: (previous, current) {
        return current is DashboardLoadingState ||
            current is DashboardLoadingSuccessState ||
            current is DashboardScreenActiveState ||
            current is DevicesScreenActiveState ||
            current is ChatScreenActiveState ||
            current is MaintenanceScreenActiveState ||
            current is ReportScreenActiveState;
      },
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
        if (state is DashboardLoadingState) {
          return const Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [CircularProgressIndicator()],
              ),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: const Icon(
                Icons.menu,
                size: 35,
              ),
              actions: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.notifications_none_outlined,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.support_agent,
                      size: 35,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                )
              ],
            ),

            // BODY SECTION STARTS HERE

            body: BlocConsumer<DashboardblocBloc, DashboardblocState>(
              listener: (context, state) {
                // TODO: implement listener
              },
              builder: (context, state) {
                if (state is DevicesScreenActiveState) {
                  return const DeviceInventorySectionView();
                } else if (state is ChatScreenActiveState) {
                  return const ChatSectionView();
                } else if (state is MaintenanceScreenActiveState) {
                  return const MaintenanceSectionView();
                } else if (state is ReportScreenActiveState) {
                  return const ReportSectionView();
                } else if (state is DashboardScreenActiveState) {
                  return const HomeSectionView();
                } else {
                  return const HomeSectionView();
                }
              },
            ),

            // BODY SECTION ENDS HERE

            // BOTTOM NAV BAR STARTS HERE
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.desktop_mac_outlined),
                  label: 'Devices',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'Chat',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Maintenance',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.bar_chart_outlined),
                  label: 'Reports',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: const Color.fromRGBO(42, 102, 176, 1),
              unselectedItemColor: const Color.fromRGBO(75, 75, 75, 1),
              onTap: _onItemTapped,
            ),
          );
        }
      },
    );
  }
}
