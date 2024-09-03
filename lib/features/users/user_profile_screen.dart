import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            title: const Text('킹호진'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const FaIcon(
                  FontAwesomeIcons.gear,
                  size: Sizes.size24,
                ),
              )
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  foregroundColor: Colors.blue,
                  foregroundImage: NetworkImage(
                      'https://avatars.githubusercontent.com/u/74577721?v=4'),
                  child: Text('킹호진'),
                ),
                Gaps.v10,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '@킹호진',
                      style: TextStyle(
                          fontWeight: FontWeight.w600, fontSize: Sizes.size20),
                    ),
                    Gaps.h6,
                    FaIcon(
                      FontAwesomeIcons.solidCircleCheck,
                      size: Sizes.size16,
                      color: Colors.lightBlue,
                    ),
                  ],
                ),
                Gaps.v20,
                SizedBox(
                  height: Sizes.size60, // verticalDivider가 부모의 크기를 사용하기 때문에 설정
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          const Text(
                            '37',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.size20),
                          ),
                          Gaps.v1,
                          Text(
                            'Following',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.size16,
                            ),
                          )
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: Sizes.size1,
                        color: Colors.grey.shade200,
                        indent: Sizes.size14,
                        endIndent: Sizes.size14,
                      ),
                      Column(
                        children: [
                          const Text(
                            '10.5M',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.size20),
                          ),
                          Gaps.v1,
                          Text(
                            'Followers',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.size16,
                            ),
                          )
                        ],
                      ),
                      VerticalDivider(
                        width: Sizes.size32,
                        thickness: Sizes.size1,
                        color: Colors.grey.shade200,
                        indent: Sizes.size14,
                        endIndent: Sizes.size14,
                      ),
                      Column(
                        children: [
                          const Text(
                            '150.4M',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: Sizes.size20),
                          ),
                          Gaps.v1,
                          Text(
                            'Likes',
                            style: TextStyle(
                              color: Colors.grey.shade400,
                              fontSize: Sizes.size16,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Gaps.v20,
                FractionallySizedBox(
                  widthFactor: 0.40,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: Sizes.size12,
                      horizontal: Sizes.size6,
                    ),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(Sizes.size3),
                    ),
                    child: const Text(
                      'Follow',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Gaps.v10,
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.size36),
                  child: Text(
                    '노랗고 매콤하고 향기롭지는 않지만 타지마할 양파넣고 감자넣고 소고기는 넣지않아 나마스테 아아 둘이 먹다 하나 죽어도 모르는 이 맛은 왼손으로 비비지말고 오른손으로 돌려먹어라 (롸잇 나우)',
                    textAlign: TextAlign.center,
                  ),
                ),
                Gaps.v10,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.link,
                      size: Sizes.size14,
                    ),
                    Gaps.h6,
                    Text(
                      'https://www.google.com',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Gaps.v10,
                Container(
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal: BorderSide(
                    color: Colors.grey.shade200,
                    width: 0.5,
                  ))),
                  child: const TabBar(
                    labelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(
                      vertical: Sizes.size14,
                    ),
                    indicatorColor: Colors.black,
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
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: const TabBarView(
                    children: [
                      Center(
                        child: Text('Page one'),
                        // 여기에 GridView를 생성하게 되면 스크롤이 두 개 중복되는 문제 발생!!!
                      ),
                      Center(
                        child: Text('Page two'),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
