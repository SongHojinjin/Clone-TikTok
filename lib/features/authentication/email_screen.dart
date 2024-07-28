import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/password_sreen.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailcontroller = TextEditingController();

  String _email = '';

  @override
  void initState() {
    super.initState();

    _emailcontroller.addListener(() {
      
      setState(() {
        _email = _emailcontroller.text;
      });
    },);
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    super.dispose();
  }

  String? _isEmailValid(){
    if(_email.isEmpty) return null;
    final regExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if(!regExp.hasMatch(_email)){
      return 'Email not valid';
    }
    return null;
  }

  void _onScaffoldTap(){
    FocusScope.of(context).unfocus();
  }

  void _onSubmit(){
    if(_email.isEmpty || _isEmailValid() != null) return;
    Navigator.push(context, MaterialPageRoute(builder: 
      (context) => const PasswordSreen(),));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Sign up',),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v40,
              const Text('What is your Email?',
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),),
              Gaps.v16,
              TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                // onSubmitted: (value) => , // 값을 모를때 키보드에서 보내기 버튼 클릭시
                onEditingComplete: _onSubmit,
                autocorrect: false,
                decoration: InputDecoration(
                  hintText: 'Email',
                  errorText: _isEmailValid(),
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
                onTap: _onSubmit,
                child: FormButton(disabled: _email.isEmpty || 
                  _isEmailValid() != null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
