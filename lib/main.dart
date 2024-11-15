import 'package:flutter/material.dart';
import 'package:flutter_reusable_stuff/ui/widgets/choice_widgets/single_choice/single_choice_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(child: SingleChoicePage()),
    );
  }
}