import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ryde_user/constants/color.dart';
import 'package:ryde_user/screens/onboarding/first_onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Timer.periodic(const Duration(seconds: 5), ((timer) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const FirstOnboarding();
      }));
    }));
    return Scaffold(
      backgroundColor: AppColors.purple,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.light,
          statusBarColor: Colors.transparent,
        ),
      ),
      body: Center(
        child: Text(
          "Ryde",
          style: Theme.of(context)
              .textTheme
              .headline3!
              .copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
