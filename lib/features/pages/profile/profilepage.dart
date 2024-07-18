// ignore_for_file: type_literal_in_constant_pattern

import 'package:dhmsmobileapp/features/pages/profile/bloc/profilesection_bloc.dart';
import 'package:dhmsmobileapp/features/pages/profile/widgets/detailswidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    profilesectionBloc.add(ProfileSectionBaseEvent());
    // TODO: implement initState
    super.initState();
  }

  final ProfilesectionBloc profilesectionBloc = ProfilesectionBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfilesectionBloc, ProfilesectionState>(
      bloc: profilesectionBloc,
      // buildWhen: (previous, current) => current is ProfilesectionState,
      // listenWhen: (previous, current) => current is ProfilesectionState,
      listener: (previous, state) => {
        if (state is NavigateToDashboardEvent)
          {
            Navigator.pop(context),
          }
      },
      builder: (context, state) {
        // GetProfileDetailsLoading
        switch (state.runtimeType) {
          case (GetProfileDetailsLoading):
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );

          case (AllProfileDetails):
            // final successState = state as AllProfileDetails;
            final User = state as AllProfileDetails;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Company Profile'),
              ),
              body: ListView.builder(
                itemCount: User.userdetails.length,
                itemBuilder: (context, index) {
                  return Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          detailsrow(
                            DetailCaption: 'Company name',
                            DetailAnswer: User.userdetails[index].companyname,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          detailsrow(
                            DetailCaption: 'Company email',
                            DetailAnswer: User.userdetails[index].email,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          detailsrow(
                            DetailCaption: 'Company Phone Number',
                            DetailAnswer: User.userdetails[index].phone,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ));
                },
              ),
            );
          default:
            return Scaffold(
              body: Center(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'An error occured loading this page',
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
