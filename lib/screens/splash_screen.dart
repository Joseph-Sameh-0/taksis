import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/connectivity_cubit.dart';
import 'logo.dart';
import 'main_screen.dart';
import 'no_connection_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityCubit, ConnectivityState>(
        builder: (context, state) {
          if (state is ConnectivityInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ConnectivityConnected) {
            Timer(const Duration(seconds: 2), () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => MainScreen()),
              );
            });
            return const Logo();
          } else if (state is ConnectivityDisconnected) {
            return NoConnectionScreen(
              onRetry: () =>
                  context.read<ConnectivityCubit>().retryConnection(),
            );
          } else {
            return Center(child: Text("Unknown state"));
          }
        },
      ),
    );
  }
}
