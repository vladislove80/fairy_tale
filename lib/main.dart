import 'package:fairy_tale/fairytale/fairy_tale_page.dart';
import 'package:fairy_tale/theme/app_them.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: AppTheme.fontFamilyVollkorn,
      ),
      home: const FairyTalePage(title: 'Flutter Demo Home Page'),
    );
  }
}
