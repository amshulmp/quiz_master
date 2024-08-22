import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/provider/quizprovider.dart';
import 'package:quiz_master/screens/home.dart';

import 'package:quiz_master/screens/quizzscreen.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  const ResultScreen({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return PopScope(
     canPop: false,
      child: Scaffold(
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            padding: const EdgeInsets.all(70.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "GAME OVER!",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "YOUR SCORE",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "$score",
                  style: const TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
               
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                      height: 40,
                      onPressed: () {
                        final quizProvider = Provider.of<QuizProvider>(context, listen: false);
                        quizProvider.resetQuiz(); 
                    
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return const QuizzScreen(); 
                            },
                          ),
                        );
                      },
                      color: Theme.of(context).secondaryHeaderColor,
                      child: const Text(
                        "Retry !",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w800,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    MaterialButton(
                  height: 40,
                  onPressed: () {
                    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
                    quizProvider.resetQuiz(); 

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Home(); 
                        },
                      ),
                    );
                  },
                  color: Theme.of(context).secondaryHeaderColor,
                  child: const Text(
                    "Home",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
                  ],
                ),
              
               
              ],
            ),
          ),
        ),
      ),
    );
  }
}
