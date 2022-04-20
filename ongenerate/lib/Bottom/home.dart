import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ongenerate/Bottom/login_info.dart';
import 'package:ongenerate/Bottom/notification.dart';
import 'package:ongenerate/arguments.dart';

import '../login.dart';
import 'package:ongenerate/bottompages.dart';


class HomePage extends StatefulWidget {
//  String? email;
//  var password;
final Arguments? arguments;
  HomePage([this.arguments]);

  static const String routeName = "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
     


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Home Page'),
        actions: [
          IconButton(
            onPressed: (){
                           Navigator.of(context).pushNamed(NotificationPage.routeName,
                           );

            }, 
            icon: Icon(
              Icons.notification_add,
            color: Colors.red,
            size: 36,
            ))
        ],
      ),
      body: Column(
        children: [
          Text('Home Page '),
          
          
         
          ElevatedButton(
            onPressed: (){
            Navigator.of(context).pushNamed(LoginInfo.routeName, 
            arguments: Logininfodata(
            
             )
             );  
            }, 
            child: Text("Get login info"))



        ],
      ),
    );
  }
}