import 'package:flutter/material.dart';


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
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: <Widget>[
            Positioned(
              top: 50,
              child: SizedBox(
                  width: 280,
                  child: Image.asset('images/logo.png')
              ),
            ),
            Positioned(
              child: SizedBox(
                  width: 330,
                  child: Image.asset('images/santa.png')
              ),
            ),
            Positioned(
              top: 300,
              width: 250,
              height: 250,
              child: SizedBox(
                  height: 10,
                  width: 10,
                  child: Image.asset('images/presentbox.png')
              ),
            ),
          ],
        ),
      ),
    );
  }
}
