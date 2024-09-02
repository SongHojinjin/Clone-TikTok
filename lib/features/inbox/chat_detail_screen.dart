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
  late final TextEditingController _textEditingController =
      TextEditingController();

  bool _isTextEmpty = true;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(_updateSendButtonColor);
  }

  @override
  void dispose() {
    _textEditingController.removeListener(_updateSendButtonColor);
    _textEditingController.dispose();
    super.dispose();
  }

  void _updateSendButtonColor() {
    final bool isTextEmpty = _textEditingController.text.isEmpty;

    if (isTextEmpty != _isTextEmpty) {
      setState(() {
        _isTextEmpty = isTextEmpty;
      });
    }
  }

  void _onDismissKeyboard() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: ListTile(
          contentPadding: const EdgeInsets.only(right: Sizes.size8),
          leading: Stack(
            children: [
              const CircleAvatar(
                foregroundImage: NetworkImage(
                    'https://avatars.githubusercontent.com/u/74577721?v=4'),
              ),
              Positioned(
                bottom: 0,
                right: -2,
                child: Container(
                    width: Sizes.size18,
                    height: Sizes.size18,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Container(
                        width: Sizes.size12,
                        height: Sizes.size12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                      ),
                    )),
              ),
            ],
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
          GestureDetector(
            onTap: _onDismissKeyboard,
            child: ListView.separated(
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
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              height: MediaQuery.of(context).size.height * 0.1,
              color: Colors.grey.shade100,
              child: Padding(
                padding: const EdgeInsets.only(bottom: Sizes.size14),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _textEditingController,
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: Sizes.size12,
                            top: Sizes.size2,
                            bottom: Sizes.size2,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(Sizes.size32),
                            borderSide: BorderSide.none,
                          ),
                          hintText: 'Send a massage...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w400,
                          ),
                          suffixIcon: const Padding(
                            padding: EdgeInsets.all(Sizes.size10),
                            child: FaIcon(FontAwesomeIcons.faceSmile),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h10,
                    Container(
                        width: Sizes.size40,
                        height: Sizes.size40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _isTextEmpty
                              ? Colors.grey.shade300
                              : Theme.of(context).primaryColor,
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.solidPaperPlane,
                            color: Colors.white,
                            size: Sizes.size18,
                          ),
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
