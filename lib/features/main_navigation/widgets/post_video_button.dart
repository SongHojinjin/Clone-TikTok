import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class PostVideoButton extends StatelessWidget {
  const PostVideoButton({super.key});

  @override
  Widget build(BuildContext context) {
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
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(Sizes.size10)),
            child: const Center(
              child: FaIcon(
                FontAwesomeIcons.plus,
                color: Colors.black,
                size: Sizes.size20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
