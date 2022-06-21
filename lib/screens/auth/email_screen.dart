// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ryde_user/global/global_key_value.dart';
import 'package:ryde_user/screens/auth/phone_number_screen.dart';
import 'package:ryde_user/screens/auth/sign_in.dart';

import '../../constants/color.dart';
import '../../widgets/custom_appbar.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        // customTag
        isDark: isDark,
        height: appBarHeight,
        requiresAction: false,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.03,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "What's your email?",
                style: theme.headline2!.copyWith(fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 1200),
                curve: Curves.bounceIn,
                child: Text(
                    "Your travel receipt and important mail will be sent to this email",
                    style: theme.headline6!.copyWith(
                        fontWeight: FontWeight.w300, color: AppColors.grey)),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(-200 * value, 0.0),
                    child: child,
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFieldBuilder(
                isPassword: false, hint: "example@gmail.com", width: width),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: Text(
                "Already have an account?",
                style: theme.headline5!.copyWith(
                  color: AppColors.blue.withOpacity(0.7),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 1.0, end: 0.0),
        duration: const Duration(milliseconds: 1200),
        curve: Curves.bounceIn,
        child: FloatingActionButton(
          backgroundColor: AppColors.blue,
          elevation: 1,
          // foregroundColor: AppColors.black.withOpacity(0.1),
          focusColor: AppColors.black.withOpacity(0.1),
          splashColor: AppColors.black.withOpacity(0.1),
          hoverColor: AppColors.black.withOpacity(0.1),
          hoverElevation: 1,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return const PhoneNumberScreen();
            }));
          },
          child: const Icon(Icons.arrow_forward),
        ),
        builder: (context, double value, child) {
          return Transform.translate(
            offset: Offset(-150 * value, 0.0),
            child: child,
          );
        },
      ),
    );
  }
}
