import 'package:flutter/material.dart';
import 'package:taksis/colors.dart';
import 'package:taksis/screens/Account/widgets/signup/signup.dart';

import '../my_app_bar.dart';
import 'widgets/forgot_password/forgot_password.dart';
import 'widgets/login/login.dart';
import 'widgets/profile/profile.dart';

class Account extends StatefulWidget {
  final Function(int) onNavigate;

  const Account({super.key, required this.onNavigate});

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  bool isLoggedIn = false;
  String currentPage = 'Login';

  _showLogin() {
    setState(() => currentPage = 'Login');
  }

  void _login() {
    setState(() {
      isLoggedIn = true;
      currentPage = 'Profile';
    });
  }

  void _forgotPassword() {
    setState(() {
      currentPage = 'Forgot password';
    });
  }

  void _signUp() {
    setState(() {
      currentPage = 'Sign up';
    });
  }

  void _logout() {
    setState(() {
      isLoggedIn = false;
      currentPage = 'Login';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (isLoggedIn) {
      content = Profile(logout: _logout, onNavigate: widget.onNavigate);
    } else {
      switch (currentPage) {
        case 'Login':
          content = Login(
              login: _login, forgotPassword: _forgotPassword, signUp: _signUp);
          break;
        case 'Forgot password':
          content = ForgotPassword(showLogin: _showLogin);
          break;
        case 'Sign up':
          content = Signup(showLogin: _showLogin);
          break;
        default:
          content = Login(
              login: _login, forgotPassword: _forgotPassword, signUp: _signUp);
      }
    }

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: MyAppBar(onNavigate: widget.onNavigate, title: currentPage),
      body: content,
    );
  }
}
