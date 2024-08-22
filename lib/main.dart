import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_master/provider/quizprovider.dart';
import 'package:quiz_master/screens/splash.dart';
import 'package:quiz_master/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => QuizProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
