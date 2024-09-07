import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _notifications = false;

  void _onNotificationChanged(bool? newValue) {
    if (newValue == null) return;
    setState(() {
      _notifications = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings'),
          centerTitle: true,
        ),
        body: ListView(
          children: [
            // can use 'adaptive'.
            Switch(
              value: _notifications,
              onChanged: _onNotificationChanged,
            ),

            Checkbox(
              value: _notifications,
              onChanged: _onNotificationChanged,
            ),
            SwitchListTile(
              value: _notifications,
              onChanged: _onNotificationChanged,
              activeColor: Theme.of(context).primaryColor,
              title: const Text('Enable notifications'),
            ),
            CheckboxListTile(
              value: _notifications,
              onChanged: _onNotificationChanged,
              activeColor: Theme.of(context).primaryColor,
              title: const Text('Enable notifications'),
            ),
            ListTile(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2030),
                );
                print(date);
                final time = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                print(time);
                final booking = await showDateRangePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime(2030),
                  builder: (context, child) {
                    return Theme(
                      data: ThemeData(
                          appBarTheme: const AppBarTheme(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.black,
                      )),
                      child: child!,
                    );
                  },
                );
                print(booking);
              },
              title: const Text('When is your birthday?'),
            ),
            ListTile(
              onTap: () {
                showCupertinoModalPopup(
                  //showCupertinoDialog
                  context: context,
                  builder: (context) => CupertinoActionSheet(
                    //CupertinoAlertDialog
                    title: const Text('Are you sure?'),
                    //content: const Text('가지마삼요'),
                    message: const Text('가지마삼요'),
                    actions: [
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDefaultAction: true,
                        child: const Text('No'),
                      ),
                      CupertinoDialogAction(
                        onPressed: () => Navigator.of(context).pop(),
                        isDestructiveAction: true,
                        child: const Text('Yes'),
                      ),
                      CupertinoActionSheetAction(
                        onPressed: () => Navigator.of(context).pop(),
                        child: const Text('앙'),
                      ),
                    ],
                  ),
                );
              },
              title: const Text(
                'Log out',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            const AboutListTile() // ShowAboutDialog()
          ],
        ));
  }
}
