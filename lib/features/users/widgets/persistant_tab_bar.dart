import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

class PersistantTabBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final bool isDark = isDarkMode(context);
    return Container(
      decoration: BoxDecoration(
          color: isDark
              ? Theme.of(context).appBarTheme.backgroundColor
              : Colors.white,
          border: Border.symmetric(
              horizontal: BorderSide(
            color: isDark ? Colors.grey.shade800 : Colors.grey.shade200,
            width: 0.5,
          ))),
      child: const TabBar(
        labelPadding: EdgeInsets.symmetric(
          vertical: Sizes.size14,
        ),
        indicatorSize: TabBarIndicatorSize.label,
        tabs: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: Icon(Icons.grid_4x4_rounded),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Sizes.size12),
            child: FaIcon(FontAwesomeIcons.heart),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 55;

  @override
  double get minExtent => 55;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
