import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taksis/colors.dart';

import 'cubits/connectivity_cubit.dart';
import 'firebase_options.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(

        appBarTheme: AppBarTheme(
          // color: Colors.white,
          backgroundColor: primaryColor,
          iconTheme: IconThemeData(
            color: lightSecondaryColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Taksis',
      home: BlocProvider(
        create: (_) => ConnectivityCubit(),
        child: SplashScreen(),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: ImageUploadTest(),
//     );
//   }
// }
