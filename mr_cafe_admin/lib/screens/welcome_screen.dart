import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';

import 'package:mr_cafe_admin/screens/offers_screen.dart';
import 'package:mr_cafe_admin/screens/orders_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * .2,
                  child: Image.asset(
                    'assets/logo.png',
                    fit: BoxFit.fill,
                  )),
              Container(
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white.withOpacity(0.3)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Text(
                        'Login',
                        style:
                            TextStyle(fontSize: 20.0, color: Color(0xff632B13)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                          // prefixIconColor: Colors.green,

                          focusColor: Colors.black,
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * .02),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * .025),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, OrdersPage.id);
                },
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 18.0),
                ),
                style: ElevatedButton.styleFrom(
                    primary: kButtonColor,
                    fixedSize: Size(MediaQuery.of(context).size.width * .5,
                        MediaQuery.of(context).size.height * .05)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont't have an account!"),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Register?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      ))
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
            ],
          ),
        ),
      )),
    );
  }
}
