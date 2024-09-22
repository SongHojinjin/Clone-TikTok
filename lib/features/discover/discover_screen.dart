import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/break_points.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/utils.dart';

final tabs = [
  'Top',
  'Users',
  'Videos',
  'Sounds',
  'LIVE',
  'Shopping',
  'Brands',
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String text) {}

  void _onSearchSubmitted(String text) {}

  void _onClearTap() {
    setState(() {
      _textEditingController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width; // 화면의 크기가 바뀔 때마다 값이 바뀜
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: Row(
              children: [
                Gaps.h10,
                const FaIcon(
                  FontAwesomeIcons.chevronLeft,
                  size: Sizes.size28,
                ),
                Gaps.h20,
                ConstrainedBox(
                  constraints: kIsWeb
                      ? const BoxConstraints(
                          maxWidth: Breakpoints.sm,
                        )
                      : BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width / 2,
                        ),
                  child: Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      onChanged: _onSearchChanged,
                      onSubmitted: _onSearchSubmitted,
                      style: const TextStyle(fontSize: Sizes.size16),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: Sizes.size10, horizontal: Sizes.size12),
                        //isDense: true,
                        fillColor: isDarkMode(context)
                            ? Colors.black26
                            : Colors.grey.shade100,
                        filled: true,
                        hintText: 'Search',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.size8),
                          borderSide: BorderSide.none,
                        ),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.all(12.0),
                          child: FaIcon(
                            FontAwesomeIcons.magnifyingGlass,
                            size: Sizes.size20,
                          ),
                        ),
                        suffix: GestureDetector(
                          onTap: _onClearTap,
                          child: Padding(
                            padding: const EdgeInsets.only(left: Sizes.size12),
                            child: FaIcon(
                              FontAwesomeIcons.solidCircleXmark,
                              size: Sizes.size20,
                              color: Colors.grey.shade500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Gaps.h20,
                const FaIcon(FontAwesomeIcons.sliders),
                Gaps.h10,
              ],
            ),
            bottom: TabBar(
              onTap: (value) {
                FocusScope.of(context).unfocus();
              },
              tabAlignment: TabAlignment.center,
              padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: Sizes.size20),
              labelStyle: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              isScrollable: true,
              splashFactory: NoSplash.splashFactory,
              tabs: [
                for (var tab in tabs)
                  Tab(
                    text: tab,
                  )
              ],
            ),
          ),
          body: TabBarView(children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 20,
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size6,
                vertical: Sizes.size8,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.md ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 21,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Sizes.size3),
                      ),
                      child: AspectRatio(
                        aspectRatio: 9 / 16,
                        child: FadeInImage.assetNetwork(
                            fit: BoxFit.cover,
                            placeholder: 'assets/images/surprised.jpeg',
                            image: 'https://img-store.theqoo.net/ghjUb.jpg'),
                      ),
                    ),
                    Gaps.v4,
                    Text(
                      '${constraints.maxWidth} Hello, You faced the lucky boy wearing red T-shirt. Hope you have a nice day. :D',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v4,
                    if (constraints.maxWidth < 143 ||
                        constraints.maxWidth > 194)
                      DefaultTextStyle(
                        style: TextStyle(
                          color: isDarkMode(context)
                              ? Colors.grey.shade300
                              : Colors.grey.shade500,
                          fontWeight: FontWeight.w500,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: Sizes.size16,
                              backgroundImage: NetworkImage(
                                'https://avatars.githubusercontent.com/u/74577721?v=4',
                              ),
                            ),
                            Gaps.h6,
                            const Expanded(
                              child: Text(
                                'Pizza_love_also_chicken',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size14,
                              color: Colors.grey.shade500,
                            ),
                            Gaps.h3,
                            const Text('9.9M'),
                            Gaps.h8,
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(
                  tab,
                  style: const TextStyle(fontSize: Sizes.size28),
                ),
              )
          ]),
        ),
      ),
    );
  }
}
