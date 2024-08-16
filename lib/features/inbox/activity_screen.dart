import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All activity'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
        children: [
          Text(
            'New',
            style:
                TextStyle(color: Colors.grey.shade500, fontSize: Sizes.size14),
          ),
          Gaps.v12,
          ListTile(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: Sizes.size10),
            leading: Container(
              width: Sizes.size52,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Center(child: FaIcon(FontAwesomeIcons.bell)),
            ),
            title: RichText(
              text: TextSpan(
                  text: 'Account updated: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: Sizes.size16,
                  ),
                  children: [
                    const TextSpan(
                        text: 'Upload longer videos ',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                        )),
                    TextSpan(
                        text: '1h',
                        style: TextStyle(
                            color: Colors.grey.shade400,
                            fontWeight: FontWeight.normal))
                  ]),
            ),
            trailing: FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.grey.shade500,
            ),
          )
        ],
      ),
    );
  }
}
