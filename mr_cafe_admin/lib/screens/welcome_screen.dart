import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/constant.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  static const String id = 'welcome_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                    const Text(
                      'Login',
                      style: TextStyle(fontSize: 20.0),
                    ),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(primaryColor: Colors.black),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
                          prefixIcon: Icon(Icons.email),
                          // prefixIconColor: Colors.green,

                          focusColor: Colors.black,
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
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
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .008),
            ElevatedButton(
              onPressed: () {},
              child: Text('Login'),
              style: ElevatedButton.styleFrom(primary: Color(0xff632B13)),
            )
          ],
        ),
      )),
    );
  }
}
