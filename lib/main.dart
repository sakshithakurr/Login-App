import 'package:MyProject/models/authentication.dart';
import 'package:MyProject/screens/home_screen.dart';
import 'package:MyProject/screens/login.dart';
import 'package:MyProject/screens/register.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentication(),
        ),
      ],
      child: MaterialApp(
          title: 'Login App',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: RegisterScreen(),
          routes: {
            RegisterScreen.routeName: (ctx) => RegisterScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
          }),
    );
  }
}
