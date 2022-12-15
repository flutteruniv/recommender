import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recommender_app/firebase_options.dart';
import 'package:recommender_app/pages/launch_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Koruri',
      ),
      home: const LaunchPage(),
    );
  }
}
