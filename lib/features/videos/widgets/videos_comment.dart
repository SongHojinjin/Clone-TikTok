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
  final ScrollController _scrollController = ScrollController();

  bool _isWriting = false;

  void _onStartWriting() {
    setState(() {
      _isWriting = true;
    });
  }

  void _onColsedPressed() {
    Navigator.of(context).pop();
  }

  void _onDismissKeyboard() {
    FocusScope.of(context).unfocus();
    setState(() {
      _isWriting = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.75,
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
        body: GestureDetector(
          onTap: _onDismissKeyboard,
          child: Stack(
            children: [
              Scrollbar(
                controller: _scrollController,
                child: ListView.separated(
                    padding: const EdgeInsets.only(
                        top: Sizes.size10,
                        bottom: Sizes.size10,
                        left: Sizes.size16,
                        right: Sizes.size16),
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
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: BottomAppBar(
                  color: Colors.grey.shade50,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      bottom: Sizes.size5,
                      top: Sizes.size5,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          radius: Sizes.size24,
                          backgroundImage: NetworkImage(
                            'https://avatars.githubusercontent.com/u/74577721?v=4',
                          ),
                        ),
                        Gaps.h10,
                        Expanded(
                          child: TextField(
                            onTap: _onStartWriting,
                            expands: true,
                            minLines: null,
                            maxLines: null,
                            textInputAction: TextInputAction.newline,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.circular(Sizes.size12),
                                ),
                                hintText: 'Add comment...',
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.shade500),
                                filled: true,
                                fillColor: Colors.grey.shade200,
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: Sizes.size12),
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: Sizes.size8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.at,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h16,
                                      FaIcon(
                                        FontAwesomeIcons.gift,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h16,
                                      FaIcon(
                                        FontAwesomeIcons.faceSmile,
                                        color: Colors.grey.shade900,
                                      ),
                                      Gaps.h16,
                                      if (_isWriting)
                                        GestureDetector(
                                          onTap: _onDismissKeyboard,
                                          child: FaIcon(
                                            FontAwesomeIcons.circleArrowUp,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
