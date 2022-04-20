import 'package:flutter/material.dart';
import 'package:ongenerate/Bottom/home.dart';
import 'package:ongenerate/Bottom/login_info.dart';
import 'package:ongenerate/Bottom/notification.dart';
import 'package:ongenerate/arguments.dart';
import 'package:ongenerate/bottompages.dart';
import 'package:ongenerate/login.dart';

class RouteGenerate{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;
    
    switch(settings.name){
      case '/':
      return MaterialPageRoute(builder: (_)=>LoginPage());
      // case BottomPages.routeName:
      
      // return MaterialPageRoute(builder: (_)=>BottomPages(
      //   arguments: args as Arguments,
      // ));
      case LoginInfo.routeName:
      
      return MaterialPageRoute(builder: (_)=>LoginInfo(
        argdata: args as Arguments,
        
      ));
      case NotificationPage.routeName:
      
      return MaterialPageRoute(builder: (_)=>NotificationPage(
        
      ));
      
     default:
     return _errorRoute();
  }
}
  static Route<dynamic> _errorRoute(){
    return MaterialPageRoute(
      builder: (_){
        return Scaffold(
          appBar: AppBar(
            title: Text('Error'),

          ),
          body: Center(
            child: Text('Error'),
          ),
        );
      });
  }
}