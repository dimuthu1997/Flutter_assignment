import 'package:assessment/app.dart';
import 'package:assessment/services/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const AssignmentApp(),
    ),
  );
}
