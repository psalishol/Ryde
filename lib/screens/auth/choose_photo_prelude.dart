import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ryde_user/global/global_key_value.dart';
import 'package:ryde_user/screens/auth/take_photo.dart';
import 'package:ryde_user/widgets/custom_appbar.dart';

import '../../constants/color.dart';

class ChoosephotoPrelude extends StatefulWidget {
  const ChoosephotoPrelude({Key? key}) : super(key: key);

  @override
  State<ChoosephotoPrelude> createState() => _ChoosephotoPreludeState();
}

class _ChoosephotoPreludeState extends State<ChoosephotoPrelude>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;

  late AnimationController animationController;
  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      lowerBound: 0.5,
      upperBound: 0.6,
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    animation =
        CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: const CustomAppBar(
        isDark: false,
        height: appBarHeight,
        requiresAction: false,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            // color: Colors.red,
            alignment: Alignment.centerLeft,
            child: ScaleTransition(
              scale: animation,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: AppColors.blue.withOpacity(0.1),
                ),
                child: Icon(
                  Icons.person_outline_outlined,
                  color: AppColors.blue,
                  size: 30,
                ),
              ),
            ),
          ),
          // const SizedBox(
          //   height: 10,
          // ),
          Container(
              // color: AppColors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              width: double.infinity,
              child: Text(
                "Add your photo for safer \nsmoother pickup",
                style: theme.headline5!
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 19),
              )),

          const SizedBox(
            height: 10,
          ),
          Container(
              // color: AppColors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              width: width,
              child: Text(
                "Your photo will be used by your driver to safely identify you for safer rides",
                style: theme.headline5!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 14),
              )),
          const SizedBox(
            height: 10,
          ),
          Container(
              // color: AppColors.grey,
              margin: const EdgeInsets.symmetric(horizontal: 13),
              width: width,
              child: Text(
                "Driver can only view your picture during pickup and will not be able to access it when the ride is complete",
                style: theme.headline5!
                    .copyWith(fontWeight: FontWeight.w300, fontSize: 14),
              )),

          SizedBox(
            height: height * 0.49,
          ),

          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const TakePhotoScreen();
              }));
            },
            child: Hero(
              tag: 'close-button-to-take-photo',
              child: Container(
                height: 60,
                width: width,
                margin: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blue),
                child: Center(
                  child: Text(
                    "Take Photo",
                    style: theme.headline4!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
