import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:quiz_master/screens/quizzscreen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

 Future<bool> _showExitDialog(BuildContext context) async {
  return (await showDialog<bool>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm Exit"),
            content: const Text("Do you really want to exit the app?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text("No"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                  
                  if (Platform.isAndroid || Platform.isIOS) {
                    SystemNavigator.pop(); 
                  } else {
                    exit(0); 
                  }
                },
                child: const Text("Yes"),
              ),
            ],
          );
        },
      )) ??
      false;
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool exit = await _showExitDialog(context);
        return exit;
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "assets/fotor-ai-20240821144927-removebg-preview.png",
                height: 300,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/f7e16fcf3598c680a4a43ffed713d4ff.png",
                height: 80,
                fit: BoxFit.cover,
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: MaterialButton(
                        height: 70,
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (BuildContext context) {
                            return const QuizzScreen();
                          }));
                        },
                        color: Theme.of(context).primaryColor,
                        child: const Text(
                          "Start Quiz",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 19,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
