import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class VideosComment extends StatefulWidget {
  const VideosComment({super.key});

  @override
  State<VideosComment> createState() => _VideosCommentState();
}

class _VideosCommentState extends State<VideosComment> {
  void _onColsedPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(Sizes.size14)),
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          automaticallyImplyLeading: false,
          title: const Align(
            alignment: Alignment.center,
            child: Text(
              '1234 comments',
            ),
          ),
          actions: [
            IconButton(
                onPressed: _onColsedPressed,
                icon: const FaIcon(FontAwesomeIcons.xmark))
          ],
        ),
        body: ListView.separated(
            padding: const EdgeInsets.symmetric(
                vertical: Sizes.size10, horizontal: Sizes.size16),
            separatorBuilder: (context, index) => Gaps.v14,
            itemCount: 10,
            itemBuilder: (context, index) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: Sizes.size24,
                      child: Text('^o^'),
                    ),
                    Gaps.h8,
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '킹호진',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.size14,
                            color: Colors.grey.shade500,
                          ),
                        ),
                        Gaps.v6,
                        const Text(
                            '즐겁고 재미있고 나만 못하고 남들은 잘하는 코딩 최고!! and this is english.'),
                      ],
                    )),
                    Gaps.v10,
                    Column(
                      children: [
                        Gaps.v4,
                        FaIcon(
                          FontAwesomeIcons.heart,
                          color: Colors.grey.shade500,
                          size: Sizes.size24,
                        ),
                        Text(
                          '15.3K',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    )
                  ],
                )),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey.shade50,
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/74577721?v=4'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
