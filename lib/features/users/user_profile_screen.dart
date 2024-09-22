import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';
import 'package:tiktok_clone/features/users/widgets/persistant_tab_bar.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  void _onSettingPressed() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const SettingsScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            physics: const BouncingScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  title: const Text('킹호진'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                      onPressed: _onSettingPressed,
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
                      Gaps.v10,
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
                                fontWeight: FontWeight.w600,
                                fontSize: Sizes.size20),
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
                        height: Sizes
                            .size60, // verticalDivider가 부모의 크기를 사용하기 때문에 설정
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
                    ],
                  ),
                ),
                SliverPersistentHeader(
                  delegate: PersistantTabBar(),
                  pinned: true,
                ),
              ];
            },
            body: GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: Sizes.size3,
                mainAxisSpacing: Sizes.size3,
                childAspectRatio: 9 / 14,
              ),
              itemBuilder: (context, index) => Column(
                children: [
                  AspectRatio(
                    aspectRatio: 9 / 14,
                    child: FadeInImage.assetNetwork(
                        fit: BoxFit.cover,
                        placeholder: 'assets/images/surprised.jpeg',
                        image: 'https://img-store.theqoo.net/ghjUb.jpg'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
