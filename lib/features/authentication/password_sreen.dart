import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/birthday_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class PasswordSreen extends StatefulWidget {
  const PasswordSreen({super.key});

  @override
  State<PasswordSreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordSreen> {
  final TextEditingController _passwordcontroller = TextEditingController();

  String _password = '';

  @override
  void initState() {
    super.initState();

    _passwordcontroller.addListener(
      () {
        setState(() {
          _password = _passwordcontroller.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordcontroller.dispose();
    super.dispose();
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _password.length > 8;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  bool _obscureText = true;

  void _onSubmit() {
    if (!_isPasswordValid()) return;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const BirthdayScreen(),
        ));
  }

  void _onClearTap() {
    _passwordcontroller.clear();
  }

  void _toggleObscureText() {
    _obscureText = !_obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
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
                'Make your password',
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordcontroller,
                // onSubmitted: (value) => , // 값을 모를때 키보드에서 보내기 버튼 클릭시
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                autocorrect: false,
                decoration: InputDecoration(
                    suffix: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: _onClearTap,
                          child: FaIcon(
                            FontAwesomeIcons.solidCircleXmark,
                            color: Colors.grey.shade400,
                            size: Sizes.size20,
                          ),
                        ),
                        Gaps.h16,
                        GestureDetector(
                          onTap: _toggleObscureText,
                          child: FaIcon(
                            _obscureText
                                ? FontAwesomeIcons.eyeSlash
                                : FontAwesomeIcons.eye,
                            color: Colors.grey.shade400,
                            size: Sizes.size20,
                          ),
                        ),
                      ],
                    ),
                    hintText: 'Make it strong',
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
              const Text(
                'Yout password must have:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v14,
              Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.circleCheck,
                    size: Sizes.size20,
                    color: _isPasswordValid()
                        ? Colors.green
                        : Colors.grey.shade400,
                  ),
                  Gaps.h5,
                  const Text('8 to 20 characters'),
                ],
              ),
              Gaps.v28,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(disabled: !_isPasswordValid()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
