import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'data/repository_data.dart';
import 'screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepositoryData(),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData.dark().copyWith(
            primaryColor: const Color.fromARGB(255, 29, 29, 40),
            scaffoldBackgroundColor: const Color.fromARGB(255, 29, 29, 40),
          ),
          home: const MyHomePage(title: 'Flutter Repositories'),
        );
      },
    );
  }
}
