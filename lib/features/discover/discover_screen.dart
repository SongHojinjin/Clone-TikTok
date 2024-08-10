import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.start,
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size16),
            labelPadding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
            unselectedLabelColor: Colors.grey.shade500,
            labelColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
            indicatorColor: Colors.black,
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
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: Sizes.size10,
              mainAxisSpacing: Sizes.size10,
              childAspectRatio: 9 / 21,
            ),
            itemBuilder: (context, index) => Column(
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
                const Text(
                  'Hello, You faced the lucky boy wearing red T-shirt. Hope you have a nice day. :D',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v4,
                DefaultTextStyle(
                  style: TextStyle(
                    color: Colors.grey.shade500,
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
          for (var tab in tabs.skip(1))
            Center(
              child: Text(
                tab,
                style: const TextStyle(fontSize: Sizes.size28),
              ),
            )
        ]),
      ),
    );
  }
}
