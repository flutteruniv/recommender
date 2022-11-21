import 'package:flutter/material.dart';

import 'animation/flipbook.dart';
import 'search_page.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key, required this.title});

  final String title;

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Flipbook()));
                },
                child: const Text('Random')),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SearchPage(title: 'Search',)));
                },
                child: const Text('Search')),

          ],
        ),
      ),
    );
  }
}