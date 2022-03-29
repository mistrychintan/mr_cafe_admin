import 'package:flutter/material.dart';
import 'package:mr_cafe_admin/screens/welcome_screen.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  
  late Animation sizeAnimation;
  late Animation animation;
  late Animation<double> rotateAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );
    rotateAnimation = CurvedAnimation(
      parent: animationController,
      curve: Curves.decelerate,
    );

    animationController.forward();
    animationController.addListener(() {
      setState(() {});
    });
    
  }

  @override
  void dispose() {
   
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: const Color(0xFFEADBCC),
      splash: const Image(
        image: AssetImage('assets/logo.png'),
        fit: BoxFit.fill,
      ),
      duration: 3000,
      splashIconSize: animation.value * 300,
      nextScreen: const WelcomeScreen(),
          
    );
  }
}