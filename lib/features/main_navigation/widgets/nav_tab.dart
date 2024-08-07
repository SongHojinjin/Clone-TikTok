import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class NavTab extends StatelessWidget {
  const NavTab(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.icon,
      required this.onTap,
      required this.selectedIcon});

  final String text;
  final bool isSelected;
  final IconData icon;
  final IconData selectedIcon;
  // final Function onTap;
  final VoidCallback
      onTap; // GestureDetector의 onTap이 매개변수와 반환이 없는 VoidCallback 함수를 이용하므로 다음과 같이 선언

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap, // () => onTap과 같이 람다식 사용할 필요 X
        behavior: HitTestBehavior
            .translucent, // 비어있는 위젯 영역을 선택하기 위해서 container로 감싸는 것도 방법임
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isSelected ? 1 : 0.6,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                isSelected ? selectedIcon : icon,
                color: Colors.white,
              ),
              Gaps.v5,
              Text(
                text,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
