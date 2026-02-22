import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_reader_app/presentation/screens/login_screen/log_in_screen.dart';
import 'package:news_reader_app/presentation/screens/news_list/news_list_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (_) => LoginScreen(),
        "/news": (_) => NewsListScreen(),
      },
    );
  }
}