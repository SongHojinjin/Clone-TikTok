import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: const EdgeInsets.only(right: Sizes.size8),
          leading: const CircleAvatar(
            foregroundImage: NetworkImage(
                'https://avatars.githubusercontent.com/u/74577721?v=4'),
          ),
          title: const Text('잉'),
          subtitle: Text(
            'Active now',
            style:
                TextStyle(color: Colors.grey.shade400, fontSize: Sizes.size12),
          ),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(FontAwesomeIcons.flag),
              Gaps.h24,
              FaIcon(FontAwesomeIcons.ellipsis),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          ListView.separated(
              itemBuilder: (context, index) {
                var isMine = index % 2 == 0;
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size10, vertical: Sizes.size2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: isMine
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(Sizes.size16),
                        decoration: BoxDecoration(
                            color: isMine ? Colors.blue : Colors.red,
                            borderRadius: BorderRadius.only(
                              topLeft: const Radius.circular(Sizes.size24),
                              topRight: const Radius.circular(Sizes.size24),
                              bottomLeft: Radius.circular(
                                  isMine ? Sizes.size24 : Sizes.size6),
                              bottomRight: Radius.circular(
                                  isMine ? Sizes.size6 : Sizes.size24),
                            )),
                        child: const Text(
                          "방가루",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => Gaps.v10,
              itemCount: 10),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade200,
              child: const Row(
                children: [
                  Expanded(
                    child: TextField(),
                  ),
                  Gaps.h20,
                  FaIcon(FontAwesomeIcons.paperPlane),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
