import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/log_in_screen.dart';
import 'package:tiktok_clone/features/authentication/username_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/auth_button.dart';
import 'package:tiktok_clone/utils.dart';
import 'package:flutter_gen/gen_l10n/intl_generate.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogInScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const UsernameScreen(),
      ),
    );
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
                    AppLocalizations.of(context)!.signUpTitle("TikTok"),
                    style: const TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Gaps.v20,
                  const Opacity(
                    opacity: 0.5,
                    child: Text(
                      'create profile,~~~',
                      style: TextStyle(
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
                      child: const AuthButton(
                        icon: FaIcon(FontAwesomeIcons.user),
                        text: 'Use email & password',
                      ),
                    ),
                    Gaps.v6,
                    const AuthButton(
                      icon: FaIcon(FontAwesomeIcons.apple),
                      text: 'Continue with Apple',
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
                  //             text: 'Use email & password',
                  //           ),
                  //         ),
                  //       ),
                  //       Gaps.h6,
                  //       const Expanded(
                  //         child: AuthButton(
                  //           icon: FaIcon(FontAwesomeIcons.apple),
                  //           text: 'Continue with Apple',
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
                    const Text('Already have an account?'),
                    Gaps.h4,
                    GestureDetector(
                      onTap: () => _onLoginTap(context),
                      child: Text(
                        'Log in',
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
