import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/inbox/activity_screen.dart';
import 'package:tiktok_clone/features/inbox/chats_screen.dart';

class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  void _onAcivityTap(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ActivityScreen(),
    ));
  }

  void _onDMPressed(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const ChatsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.grey.shade200,
        centerTitle: true,
        title: const Text('Inbox'),
        actions: [
          IconButton(
            onPressed: () => _onDMPressed(context),
            icon: const FaIcon(FontAwesomeIcons.paperPlane),
            highlightColor: Colors.transparent,
          )
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () => _onAcivityTap(context),
            title: const Text(
              'Activity',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size14),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.black,
            ),
          ),
          Divider(
            color: Colors.grey.shade300,
          ),
          ListTile(
            leading: Container(
              width: Sizes.size52,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: const Center(
                child: FaIcon(
                  FontAwesomeIcons.users,
                  color: Colors.white,
                ),
              ),
            ),
            title: const Text(
              'New followers',
              style: TextStyle(
                  fontWeight: FontWeight.w600, fontSize: Sizes.size14),
            ),
            subtitle: const Text(
              'Messages from followers will appear here',
              style: TextStyle(fontSize: Sizes.size12),
            ),
            trailing: const FaIcon(
              FontAwesomeIcons.chevronRight,
              size: Sizes.size16,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
