import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geo_tracker/screens/home/screen/home_screen.dart';
import 'package:geo_tracker/screens/profile/screen/cubit/user_cubit.dart';
import 'package:geo_tracker/screens/profile/screen/widgets/user_info.dart';
import 'package:geo_tracker/screens/profile/screen/widgets/user_photo.dart';

// ---Text---
const String _title = 'Profile';

// ---Parameters---
const double _padding = 16.0;
const double _indent = 20.0;

class ProfileScreen extends StatefulWidget {
  static const _routeName = '/profile-screen';

  static PageRoute<ProfileScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return BlocProvider(
          create: (context) => UserCubit(),
          child: const ProfileScreen(),
        );
      },
    );
  }

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileState();
}

class _ProfileState extends State<ProfileScreen> {
  UserCubit get userCubit => BlocProvider.of<UserCubit>(context);

  @override
  void initState() {
    userCubit.getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(_title),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, HomeScreen.route);
          },
        ),
      ),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state.status == UserStatus.success) {
            return Padding(
              padding: const EdgeInsets.all(_padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  UserPhoto(photo: state.photo),
                  const SizedBox(height: _indent),
                  UserInfo(
                    name: state.name,
                    email: state.email,
                  )
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
