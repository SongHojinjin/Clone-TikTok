import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen>
    with SingleTickerProviderStateMixin {
  final List<String> _notifications = List.generate(
    20,
    (index) => '${index}h',
  );

  late final AnimationController _animationController = AnimationController(
      vsync: this, duration: const Duration(microseconds: 3000));

  late final Animation<double> _animation =
      Tween(begin: 0.0, end: 1.0).animate(_animationController);

  void _onDismissed(String notification) {
    _notifications.remove(notification);
    setState(() {});
  }

  void _onTitleTap() {
    print('title tap');
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: _onTitleTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('All activity'),
              Gaps.h4,
              RotationTransition(
                turns: _animation,
                child: const FaIcon(
                  FontAwesomeIcons.chevronDown,
                  size: Sizes.size16,
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: Sizes.size12),
            child: Text(
              'New',
              style: TextStyle(
                  color: Colors.grey.shade500, fontSize: Sizes.size14),
            ),
          ),
          Gaps.v12,
          for (var notification in _notifications)
            Dismissible(
              key: Key(notification),
              onDismissed: (direction) => _onDismissed(notification),
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.green,
                child: const Padding(
                  padding: EdgeInsets.only(left: Sizes.size10),
                  child: FaIcon(
                    FontAwesomeIcons.checkDouble,
                    color: Colors.white,
                    size: Sizes.size32,
                  ),
                ),
              ),
              secondaryBackground: Container(
                alignment: Alignment.centerRight,
                color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.only(left: Sizes.size10),
                  child: FaIcon(
                    FontAwesomeIcons.trashCan,
                    color: Colors.white,
                    size: Sizes.size32,
                  ),
                ),
              ),
              child: ListTile(
                // contentPadding:
                //     const EdgeInsets.symmetric(horizontal: Sizes.size10),
                minVerticalPadding: Sizes.size20,
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
                            text: ' $notification',
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
              ),
            )
        ],
      ),
    );
  }
}
