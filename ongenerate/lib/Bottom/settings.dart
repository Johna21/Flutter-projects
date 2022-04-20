import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class SettingPage extends StatefulWidget {
  SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Setting Page'
        ),
      ),
      body: Center(
        child: Text('Setting Page'),
          ),
    );
  }
}