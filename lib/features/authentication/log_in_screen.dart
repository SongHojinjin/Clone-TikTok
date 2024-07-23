import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/sign_up_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  void onSignUpTap(BuildContext context){
      Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Log in to TikTok', 
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Text('create profile,~~~',
                style: TextStyle(
                  fontSize: Sizes.size16,
                  color: Colors.black45,
                ),),
                Gaps.v40,
                AuthButton(
                  icon: FaIcon(FontAwesomeIcons.user),
                  text: 'Use email & passwoed'),
                Gaps.v6,
                AuthButton(
                  icon: FaIcon(FontAwesomeIcons.apple),
                  text: 'Continue with Apple'),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade100,
          elevation: 1, // none
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              const Text('Don\'t have an account?'),
              Gaps.h4,
              GestureDetector(
                onTap: () => onSignUpTap(context),
                child: Text('Sign up',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),),
              )
              ],),
          ),
        ),
      ),
    );
  }
}