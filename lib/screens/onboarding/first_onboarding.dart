import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants/color.dart';

class FirstOnboarding extends StatefulWidget {
  const FirstOnboarding({Key? key}) : super(key: key);

  @override
  State<FirstOnboarding> createState() => _FirstOnboardingState();
}

class _FirstOnboardingState extends State<FirstOnboarding>
    with TickerProviderStateMixin {
  late Animation animation;
  late Animation tickAnimation;

  late AnimationController animationController;
  late AnimationController tickAnimationController;
  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    tickAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 6));

    animation = Tween<double>(begin: 0, end: 1).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    tickAnimation =
        Tween<double>(begin: 0, end: 1).animate(tickAnimationController)
          ..addListener(() {
            setState(() {});
          });

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
            statusBarColor: Colors.transparent,
          ),
        ),
        body: Stack(children: [
          Positioned(
            child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: AppColors.white),
            ),
          ),

          // Positioned(
          //     top: 200,
          //     right: 0,
          //     child: TweenAnimationBuilder(
          //       tween: Tween<double>(begin: 0, end: 200),
          //       duration: const Duration(milliseconds: 150),
          //       builder: (context, double value, child) {
          //         return Container(
          //           height: 60,
          //           width: value,
          //           color: AppColors.grey,
          //         );
          //       },
          //     )),

          // Shadow component
          Positioned(
              left: width / 2 - 80,
              top: 340,
              child: const Image(
                image: AssetImage("assets/component/shadow.png"),
              )),

          // Speckle Component
          Positioned(
              left: 70,
              top: 120,
              child: FadeTransition(
                opacity: animation as Animation<double>,
                child: const Image(
                  image: AssetImage("assets/component/speckle.png"),
                ),
              )),

          // Phone Component
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 400, end: 175),
            duration: const Duration(seconds: 2),
            builder: (context, double value, child) {
              return Positioned(
                  left: width / 2 - 50,
                  top: value,
                  child: const Image(
                    image: AssetImage("assets/component/phone.png"),
                  ));
            },
          ),

          //tick component
          Positioned(
              left: width / 2 - 28,
              top: 235,
              child: FadeTransition(
                opacity: tickAnimation as Animation<double>,
                child: const Image(
                  image: AssetImage("assets/component/tick.png"),
                ),
              )),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 360,
              child: Container(
                color: AppColors.white,
              )),

          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              height: height * 0.35,
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.purple,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
              )),
        ]));
  }

  @override
  void dispose() {
    super.dispose();
    tickAnimationController.dispose();
    animationController.dispose();
  }
}
