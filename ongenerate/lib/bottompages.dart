import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:ongenerate/Bottom/profile.dart';
import 'package:ongenerate/Bottom/home.dart';
import 'package:ongenerate/Bottom/settings.dart';
import 'package:ongenerate/login.dart';

import 'arguments.dart';


class BottomPages extends StatefulWidget {
  
  final Arguments arguments;

  
  BottomPages({Key? key,
  required this.arguments
  }) : super(key: key);

static const routeName = 'firstscreen';
  @override
  State<BottomPages> createState() => _BottomPagesState();
}

class _BottomPagesState extends State<BottomPages> {

  static String? emailifno;

  int currentTab = 0;
  // get  arguments => widget.arguments;
@override
void initstate(){
  widget;
  emailifno = widget.arguments.email;
  widget.arguments.password;
  super.initState();

}
 
  final List<Widget> screens = [
    HomePage( ),
    ProfilePage(),
    SettingPage(),
    

  ];
  
  void onTappedBar(int index){
    setState(() {
      currentTab = index;
    });
  }

  Widget currentscreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: screens[currentTab],

    bottomNavigationBar: BottomNavigationBar(
      onTap: onTappedBar,
      currentIndex: currentTab,
      backgroundColor: Colors.yellowAccent,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',

          ),
          BottomNavigationBarItem(
          icon: Icon(Icons.settings_applications),
          label: 'Setting',

          ),
      ],),

      

      )
    );
  }
}