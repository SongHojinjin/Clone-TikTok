import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: const SafeArea(
          child: TabBarView(
            children: [
              // 1 
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text('Watch cool videos!',
                          style: TextStyle(
                            fontSize: Sizes.size40,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                    Gaps.v16,
                    Text('Videos are personalizied for you based on what you watch.',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                          ),
                          ),
                  ],
                ),
              ),
              // 2
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text('Follow the rules of the app',
                          style: TextStyle(
                            fontSize: Sizes.size40,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                    Gaps.v16,
                    Text('Videos are personalizied for you based on what you watch.',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                          ),
                          ),
                  ],
                ),
              ),
              // 3 
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: Sizes.size24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gaps.v52,
                    Text('Enjoy the ride',
                          style: TextStyle(
                            fontSize: Sizes.size40,
                            fontWeight: FontWeight.bold,
                          ),
                          ),
                    Gaps.v16,
                    Text('Videos are personalizied for you based on what you watch.',
                          style: TextStyle(
                            fontSize: Sizes.size20,
                          ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(
              //vertical: Sizes.size10,
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TabPageSelector(
                  color: Colors.white,
                  selectedColor: Colors.black45,
                )
              ],
            ),
          ),
        )
      ),
    );
  }
}