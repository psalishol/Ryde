import 'package:flutter/material.dart';
import 'package:ryde_user/constants/theme.dart';
import 'package:ryde_user/screens/onboarding/first_onboarding.dart';
import 'package:ryde_user/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      home: const FirstOnboarding(),
    );
  }
}
