import 'package:flutter/material.dart';
import 'package:recommender_app/pages/select_page.dart';


class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key});

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}


class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff288776),
      body: GestureDetector(
        onTap:(){
          Navigator.push(context,
              MaterialPageRoute(
                builder:(context)
              => const SelectPage(),
              )
          );
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(image: AssetImage('images/frame.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
