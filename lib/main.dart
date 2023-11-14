import 'package:flutter/material.dart';
import 'package:nov6/add_user_view.dart';
import 'package:nov6/users_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UsersView());
  }
}
