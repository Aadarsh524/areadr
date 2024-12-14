import 'package:flutter/material.dart';

class NewsPlayerScreen extends StatefulWidget {
  const NewsPlayerScreen({super.key});

  @override
  State<NewsPlayerScreen> createState() => _NewsPlayerScreenState();
}

class _NewsPlayerScreenState extends State<NewsPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("Newsplayer"),
      ),
    ));
  }
}
