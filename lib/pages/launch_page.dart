import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:recommender_app/firebase_options.dart';


class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key, required this.title});

  final String title;

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff288776),
    );
  }
}
