import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/provider/quizprovider.dart';
import 'package:quiz_master/screens/result.dart';
import 'package:quiz_master/widgets/options.dart';
import 'package:quiz_master/widgets/question.dart';

class QuizzScreen extends StatefulWidget {
  const QuizzScreen({super.key});

  @override
  _QuizzScreenState createState() => _QuizzScreenState();
}

class _QuizzScreenState extends State<QuizzScreen> {
  @override
  void initState() {
    super.initState();
    // Call setRandomQuestions when the screen is first built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<QuizProvider>().setRandomQuestions();
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () async => false, // Prevent back navigation
      child: Scaffold(
        body: Consumer<QuizProvider>(
          builder: (context, quizProvider, child) {
            // Check if questions are loaded
            if (quizProvider.questions.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }

            final currentQuestion = quizProvider.questions[quizProvider.currentIndex];
            final options = [
              currentQuestion.option1,
              currentQuestion.option2,
              currentQuestion.option3,
              currentQuestion.option4
            ];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                Question(
                  text: currentQuestion.question,
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.27,
                  index: quizProvider.currentIndex + 1,
                ),
                SizedBox(height: screenHeight * 0.03),
                ...options.map((option) {
                  final isSelected = option == currentQuestion.answer;
                  return Option(
                    text: option,
                    width: screenWidth * 0.9,
                    onTap: () {
                      quizProvider.updateScore(isSelected ? 10 : 0);
                      if (quizProvider.currentIndex < quizProvider.questions.length - 1) {
                        quizProvider.nextQuestion();
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ResultScreen(score: quizProvider.score);
                            },
                          ),
                        );
                      }
                    },
                  );
                }),
              
                const Spacer(),
              ],
            );
          },
        ),
      ),
    );
  }
}
