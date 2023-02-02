import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:geo_tracker/screens/auth/screen/cubit/auth_cubit.dart';
import 'package:geo_tracker/screens/auth/screen/widgets/image_logo_app.dart';
import 'package:geo_tracker/screens/auth/screen/widgets/loader.dart';
import 'package:geo_tracker/screens/auth/screen/widgets/sign_in_with_google.dart';
import 'package:geo_tracker/screens/home/screen/home_screen.dart';

// ---Text---
const String _error = 'error';

// ---Parameters---
const double _padding = 16.0;
const double _indent40 = 40.0;
const double _borderRadius = 18.0;

class AuthScreen extends StatefulWidget {
  static const _routeName = '/auth-screen';

  static PageRoute<AuthScreen> get route {
    return MaterialPageRoute(
      settings: const RouteSettings(name: _routeName),
      builder: (context) {
        return BlocProvider(
          create: (context) => AuthCubit(),
          child: const AuthScreen(),
        );
      },
    );
  }

  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  AuthCubit get authCubit => BlocProvider.of<AuthCubit>(context);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          Navigator.pushReplacement(context, HomeScreen.route);
        }
        if (state.status == AuthStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(_snackBar(
            state.errorMessage!,
          ));
        }
      },
      builder: (context, state) {
        if (state.status == AuthStatus.loading) {
          return const Loader();
        }
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(_padding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageLogoApp(),
                const SizedBox(height: _indent40),
                SignInWithGoogle(onPressed: _onPressedSaveGoogle),
              ],
            ),
          ),
        );
      },
    );
  }

  void _onPressedSaveGoogle() {
    authCubit.signInWithGoogle();
  }

  SnackBar _snackBar(String error) {
    return SnackBar(
      content: Text(
        _error.toUpperCase(),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }
}
