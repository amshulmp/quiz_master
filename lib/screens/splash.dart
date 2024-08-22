import 'package:flutter/material.dart';
import 'package:quiz_master/screens/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds:2),(){
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) { 
        return const Home();
       }));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/fotor-ai-20240821144927-removebg-preview.png",
            height: 300,
            fit: BoxFit.scaleDown,
          ),
          Image.asset(
            "assets/f7e16fcf3598c680a4a43ffed713d4ff.png",
            height: 80,
            fit: BoxFit.scaleDown,
          ),
        ]),
      ),
    );
  }
}
