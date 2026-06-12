import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
import '../main.dart'; // atau MainPage file kamu

class LoginCheck extends StatefulWidget {
  const LoginCheck({super.key});

  @override
  State<LoginCheck> createState() => _LoginCheckState();
}

class _LoginCheckState extends State<LoginCheck> {
  String? token;

  @override
  void initState() {
    super.initState();
    checkLogin();
  }

  void checkLogin() async {
    final prefs = await SharedPreferences.getInstance();
    final t = prefs.getString('token');

    setState(() {
      token = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      return const LoginPage();
    } else {
      return const MainPage();
    }
  }
}