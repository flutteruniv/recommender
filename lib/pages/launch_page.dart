import 'package:flutter/material.dart';

import 'search_page.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({super.key, required this.title});

  final String title;

  @override
  State<LaunchPage> createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
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
                          builder: (context) => const SearchPage(title: 'Search',)));
                },
                child: const Text('Search')),
            const Text(
              'If you are at a loss to choose a gift for your loved one...',
            ),
          ],
        ),
      ),
    );
  }
}