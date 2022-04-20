import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class NotificationPage extends StatefulWidget {
  NotificationPage({Key? key}) : super(key: key);

  static const routeName = '/notification';


  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NOtification Page'
        ),
      ),
      body: Center(
        child: Text('Notification Page'),
          ),
    );
  }
}