import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/email_screen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';
import 'package:tiktok_clone/features/onboarding/interests_screen.dart';

class BirthdayScreen extends StatefulWidget {
  const BirthdayScreen({super.key});

  @override
  State<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends State<BirthdayScreen> {
  final TextEditingController _birthdaycontroller = TextEditingController();

  DateTime initialdate = DateTime(DateTime.now().year - 12);

  @override
  void initState() {
    super.initState();
    _setTextFieldDate(initialdate);
  }

  @override
  void dispose() {
    _birthdaycontroller.dispose();
    super.dispose();
  }

  void onNextTap(){
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InterestsScreen(),)
    );
  }

  void _setTextFieldDate(DateTime date){
    final textDate = date.toString().split(' ').first;
    _birthdaycontroller.value = TextEditingValue(text: textDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white, // appbar 색상 변경
        title: const Text('Sign up',),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text('When is your birthday?',
            style: TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w700,
            ),),
            Gaps.v8,
            const Text('Your birthday won\'t be shown publicly.',
            style: TextStyle(
              color: Colors.black54,
              fontSize: Sizes.size16,
            ),),
            Gaps.v16,
            TextField(
              //enabled: false, // 입력란의 글씨도 회색으로 보이게 됨
              readOnly: true,
              controller: _birthdaycontroller,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  )
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  )
                )
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            GestureDetector(
              onTap: onNextTap,
              child: const FormButton(disabled: false)),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 1,
        height: 356,
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: CupertinoDatePicker(
                maximumDate: initialdate,
                initialDateTime: initialdate,
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: _setTextFieldDate,
              ),
            ),
            Gaps.v32,
          ],
        ),
      ),
    );
  }
}
