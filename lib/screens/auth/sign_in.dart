// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ryde_user/extensions/email_validator.dart';

import '../../constants/color.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isDark = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,

        actions: [
          !isDark
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.dark_mode_outlined),
                  color: AppColors.black,
                )
              : IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.sunny),
                  color: AppColors.black,
                ),
          const SizedBox(
            width: 10,
          )
        ],
        leading: Row(children: [
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Hero(
              tag: 'login-to-page',
              child: Icon(
                Icons.arrow_back_outlined,
                color: AppColors.black,
              ),
            ),
          )
        ]),
        backgroundColor: Colors.white,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: Colors.transparent),
        // actions: [
        //   IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back))
        // ]
      ),
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Text(
                  "Sign in",
                  style: theme.headline2!.copyWith(
                      color: AppColors.black.withOpacity(
                        0.9,
                      ),
                      fontWeight: FontWeight.normal),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 1.0, end: 0.0),
                curve: Curves.easeInCirc,
                duration: const Duration(milliseconds: 1000),
                child: SizedBox(
                  width: width,
                  child: Text(
                    "By signing in, you may recieve an SMS for verification. Message and data rate may apply",
                    style: theme.headline6!.copyWith(
                        color: AppColors.grey, fontWeight: FontWeight.w300),
                  ),
                ),
                builder: (context, double value, child) {
                  return Transform.translate(
                    offset: Offset(-200 * value, 0.0),
                    child: child,
                  );
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldBuilder(
                callback: emailCallbackFunction,
                width: width,
                isPassword: false,
                hint: "Email",
              ),
              const SizedBox(
                height: 20,
              ),
              TextFieldBuilder(
                width: width,
                callback: emailCallbackFunction,
                isPassword: true,
                hint: "Password",
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: width,
                child: Text(
                  "Forgot Password?",
                  textAlign: TextAlign.end,
                  style: theme.headline6!.copyWith(
                      fontWeight: FontWeight.w100,
                      color: AppColors.black.withOpacity(0.6)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                width: width,
                // margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.blue),
                child: Center(
                  child: Text(
                    "Sign In",
                    style: theme.headline4!.copyWith(
                      color: AppColors.white,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const TextContainer(text: "Sign in with Google"),
              const SizedBox(
                height: 20,
              ),
              const TextContainer(text: "Sign in with Apple")
            ],
          ),
        ),
      ),
    );
  }
}

class TextContainer extends StatelessWidget {
  final String text;
  const TextContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;

    return Container(
      height: 50,
      width: width,
      // margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(width: 1.5, color: AppColors.blue.withOpacity(0.6)),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: theme.headline4!.copyWith(
            color: AppColors.blue.withOpacity(0.9),
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}

String? emailCallbackFunction(String? value) {
  if (value!.isEmpty) {
    return "Email cannot be emoty";
  } else if (value.isNotEmpty && !value.emailHasMatch()) {
    return "Not a valid mail";
  }
  return null;
}

class TextFieldBuilder extends StatelessWidget {
  TextFieldBuilder(
      {Key? key,
      required this.isPassword,
      this.callback,
      required this.hint,
      required this.width})
      : super(key: key);
  final double width;
  final bool isPassword;
  final String hint;
  String? Function(String?)? callback;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    final theme = Theme.of(context).textTheme;
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      width: width,
      child: TextFormField(
        validator: (value) {
          callback;
          return null;
        },
        autocorrect: false,

        obscureText: isPassword ? true : false,
        style: theme.headline6!.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          color: AppColors.black,
        ),
        // autofillHints: true,
        decoration: InputDecoration(
            filled: true,
            hintText: hint,
            hintStyle: theme.headline6!.copyWith(
                fontWeight: FontWeight.w100,
                color: AppColors.black.withOpacity(0.3)),
            fillColor: AppColors.lightgrey,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: AppColors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            errorBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 1.5, color: Colors.red.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.5, color: AppColors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
