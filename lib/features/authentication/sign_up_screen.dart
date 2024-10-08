import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/utils.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = '/';
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    // Navigator.of(context).push(
    //   MaterialPageRoute(
    //     builder: (context) => const LogInScreen(),
    //   ),
    // );
    Navigator.of(context).pushNamed(LogInScreen.routeName);
  }

  void _onEmailTap(BuildContext context) {
    // Navigator.of(context).push(
    //   PageRouteBuilder(
    //     transitionDuration: const Duration(seconds: 1),
    //     reverseTransitionDuration: const Duration(seconds: 1),
    //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
    //       final offsetAnimation = Tween(
    //         begin: const Offset(0, -1),
    //         end: Offset.zero,
    //       ).animate(animation);
    //       final opacityAnimation = Tween(
    //         begin: 0.5,
    //         end: 1.0,
    //       ).animate(animation);
    //       return SlideTransition(
    //         position: offsetAnimation,
    //         child: FadeTransition(
    //           opacity: opacityAnimation,
    //           child: child,
    //         ),
    //       );
    //     },
    //     pageBuilder: (context, animation, secondaryAnimation) =>
    //         const UsernameScreen(),
    //   ),
    // );
    Navigator.of(context).pushNamed(UsernameScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    print(Localizations.localeOf(context));
    return OrientationBuilder(
      builder: (context, orientation) {
        return SafeArea(
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).signUpTitle("TikTok", DateTime.now()),
                    style: const TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      S.of(context).signUpSubTitle(2),
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        // color: isDarkMode(context)
                        //     ? Colors.grey.shade400
                        //     : Colors.black45,
                      ),
                    ),
                  ),
                  Gaps.v40,
                  if (orientation == Orientation.portrait) ...[
                    GestureDetector(
                      onTap: () => _onEmailTap(context),
                      child: AuthButton(
                        icon: const FaIcon(FontAwesomeIcons.user),
                        text: S.of(context).emailPasswordBtn,
                      ),
                    ),
                    Gaps.v6,
                    AuthButton(
                      icon: const FaIcon(FontAwesomeIcons.apple),
                      text: S.of(context).appleBtn,
                    ),
                  ],
                  // if (orientation == Orientation.landscape)
                  //   Row(
                  //     children: [
                  //       Expanded(
                  //         child: GestureDetector(
                  //           onTap: () => _onEmailTap(context),
                  //           child: const AuthButton(
                  //             icon: FaIcon(FontAwesomeIcons.user),
                  //             text: S.of(context).emailPasswordBtn,
                  //           ),
                  //         ),
                  //       ),
                  //       Gaps.h6,
                  //       const Expanded(
                  //         child: AuthButton(
                  //           icon: FaIcon(FontAwesomeIcons.apple),
                  //           text: S.of(context).appleBtn,
                  //         ),
                  //       ),
                  //     ],
                  //   )
                ],
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              // color: Colors.grey.shade50,
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.size8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(S.of(context).alreadyHaveAnAccount),
                    Gaps.h4,
                    GestureDetector(
                      onTap: () => _onLoginTap(context),
                      child: Text(
                        S.of(context).logInBtn('male'),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
