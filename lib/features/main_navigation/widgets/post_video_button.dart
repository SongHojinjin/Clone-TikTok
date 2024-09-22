import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key, required this.selectedIndex});

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    final bool isDark = isDarkMode(context);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          left: 20,
          child: Container(
            height: 32,
            width: 25,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            decoration: BoxDecoration(
              color: Colors.red.shade300,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Positioned(
          right: 20,
          child: Container(
            height: 32,
            width: 25,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size10),
            decoration: BoxDecoration(
              color: Colors.blue.shade300,
              borderRadius: BorderRadius.circular(Sizes.size10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            decoration: BoxDecoration(
                color:
                    selectedIndex == 0 || isDark ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(Sizes.size10)),
            child: Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color:
                    selectedIndex == 0 || isDark ? Colors.black : Colors.white,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
