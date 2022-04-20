import 'package:flutter/material.dart';
import 'package:ongenerate/arguments.dart';

class LoginInfo extends StatelessWidget {
  final Logininfodata? arguments;
  final Arguments? argdata;
  const LoginInfo({Key? key, this.argdata,  this.arguments}) : super(key: key);
  static const String routeName = "/logininfo";


  @override
  Widget build(BuildContext context) {
    var email = arguments?.emial ?? "No login email found";
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Info"),
      ),
      body: Container(
        child:Column(
          children: [
            
              Text(argdata!.email),
              Text(argdata!.password)

            
          ],
        ) ,),
    );
  }
}