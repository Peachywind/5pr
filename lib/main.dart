import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/item_provider.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ItemProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reorderable List Example',
      home: HomeScreen(),
    );
  }
}
