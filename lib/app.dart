import 'package:assessment/screens/home_screen.dart';
import 'package:assessment/services/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AssignmentApp extends StatelessWidget {
  const AssignmentApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment',
      themeMode: ThemeMode.light,
      theme: themeProvider.theme,
      home: const HomeScreen(),
    );
  }
}
