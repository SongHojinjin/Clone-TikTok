import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  static String routeName = '/username';
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernamecontroller = TextEditingController();

  String _username = '';

  @override
  void initState() {
    super.initState();

    _usernamecontroller.addListener(
      () {
        setState(() {
          _username = _usernamecontroller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _usernamecontroller.dispose();
    super.dispose();
  }

  void onNextTap() {
    if (_username.isEmpty) return;
    // Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => EmailScreen(
    //         username: _username,
    //       ),
    //     ));
    Navigator.pushNamed(
      context,
      EmailScreen.routeName,
      arguments: EmailScreenArgs(username: _username),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign up',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              'Create username',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v8,
            const Text(
              'You can always change this later.',
              style: TextStyle(
                color: Colors.black54,
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernamecontroller,
              decoration: InputDecoration(
                  hintText: 'Username',
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  )),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ))),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
                onTap: onNextTap,
                child: FormButton(disabled: _username.isEmpty)),
          ],
        ),
      ),
    );
  }
}
