import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ongenerate/Bottom/login_info.dart';
import 'package:ongenerate/arguments.dart';
import 'package:ongenerate/bottompages.dart';

 

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const routeName = '/login'; 
  @override
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  Pattern pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
  TextEditingController controlleremail = new  TextEditingController();
  TextEditingController controllerpassword = new  TextEditingController();

  @override
  void dispose()
      {
        controlleremail.dispose();
        controllerpassword.dispose();
      }
  Widget build(BuildContext context) {
      
    return Material(
      child: CupertinoPageScaffold(
        child: Form(
          key: formkey,
          child: Padding(
            
            padding: EdgeInsets.only(
              top:120,
              left: 20,
              right: 20,
              bottom: 20,
              ),
            child: Center(
              
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                 height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),

                  child: Column(
                    children: [
                      Text("Login",
                      style: TextStyle(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.bold,
                    fontSize: 40)
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:'Enter Email',
                          prefixIcon: Icon(Icons.email)
                        ),
                        controller: controlleremail,
                        validator: (value){
                          if(value!.isEmpty || !RegExp(pattern.toString()).hasMatch(value)){
                            return "Enter Correct email";
                          }else{
                            return null;
                          }
                        }
                        ),
                      
                      SizedBox(height: 20,),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText:'Enter password',
                          prefixIcon: Icon(Icons.lock_open)
                        ),
                        obscureText: true,
                        controller: controllerpassword,
                        validator: (password){
                          if(password == null || password.isEmpty){
                            return "Enter Valid password";
                          }else if(password.length<6){
                            return "The password at least 6 character";
                          }
                          else{
                            return null;
                          }
                        }
                        ),
                      // CupertinoTextField(
                      //   textInputAction: TextInputAction.next,
                      //   obscureText: true,
                      //   placeholder: "enter password",
                      //   controller: controller,
                         
                      // ),
                      SizedBox(height: 20,),
                      
                      TextButton(
                        child: Text('Login'),
                         onPressed: (){
                           if(!formkey.currentState!.validate()){
                              return ;
                           }
                          //  Navigator.of(context).pushNamed('/second');
                          // Navigator.of(context).pushNamedAndRemoveUntil
                          // (BottomPages.routeName,
                          //  (route) => false,
                          //  arguments: Arguments(
                          //    email: controlleremail.text,
                          //    password: controllerpassword.text
                          //  )
                          //  );
                          Navigator.of(context).pushNamedAndRemoveUntil
                          (LoginInfo.routeName,
                           (route) => false,
                           arguments: Arguments(
                             email: controlleremail.text,
                             password: controllerpassword.text
                           )
                           );
                         }
                         ),
                      
                    ],
                  ),
                ),
              ),
            )
            
            ),
        ),
          ),
    );
  }
}