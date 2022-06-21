import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ryde_user/screens/onboarding/first_onboarding.dart';
import 'package:ryde_user/screens/onboarding/second_onboarding.dart';

import '../../constants/color.dart';
import '../auth/name_screen.dart';
import '../auth/sign_in.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late AssetImage assetImage;

  @override
  void initState() {
    super.initState();

    assetImage = const AssetImage(
        "assets/images/peter-chirkov-shhf7gNVRO4-unsplash.jpg");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(assetImage, context);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: AppColors.white,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: 0,
            child: Image(fit: BoxFit.cover, image: assetImage),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              height: height * 0.35,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    AppColors.black.withOpacity(0.9),
                    AppColors.black.withOpacity(0.89),
                    AppColors.black.withOpacity(0.8),
                    AppColors.black.withOpacity(0.7),
                    AppColors.black.withOpacity(0.6),
                    AppColors.black.withOpacity(0.3),
                    // AppColors.black.withOpacity(0.2),
                    AppColors.black.withOpacity(0.05),
                  ])),
            ),
          ),
          Positioned(
              left: 10,
              top: 470,
              child: TweenAnimationBuilder(
                curve: Curves.fastOutSlowIn,
                tween: Tween<double>(begin: 1.0, end: 0.0),
                duration: const Duration(milliseconds: 1200),
                child: Text(
                  "Ready,  Set, go \nin Just few quick \ntaps",
                  style: theme.headline1!.copyWith(
                      color: AppColors.white, fontWeight: FontWeight.normal),
                ),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(-200 * value, 0.0),
                    child: child,
                  );
                },
              )),
          Positioned(
              left: 10,
              top: 590,
              child: SizedBox(
                height: 60,
                width: width,
                child: TweenAnimationBuilder<double>(
                  curve: Curves.easeOutSine,
                  tween: Tween<double>(begin: 1.0, end: 0.0),
                  duration: const Duration(milliseconds: 1700),
                  child: Text(
                    "No matter where you want to go, we'll get you to your destination",
                    style: theme.headline5!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  builder: (context, double value, child) {
                    return Transform.translate(
                        offset: Offset(-200 * value, 0.0), child: child);
                  },
                ),
              )),
          Positioned(
              left: 10,
              top: 660,
              right: 10,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignInPage();
                  }));
                },
                child: Hero(
                  tag: "login-to-page",
                  child: Container(
                    height: 60,
                    width: width,
                    // margin: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.blue),
                    child: Center(
                      child: Text(
                        "Login",
                        style: theme.headline4!.copyWith(
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ),
              )),
          Positioned(
              left: width / 2 - 90,
              top: 710,
              child: SizedBox(
                height: 60,
                width: width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Need an accouunt?  ",
                      style: theme.headline5!.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return const NameScreen();
                        }));
                      },
                      child: Text(
                        "Sign Up",
                        style: theme.headline5!.copyWith(
                          color: AppColors.blue,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
