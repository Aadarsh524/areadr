import 'package:flutter/material.dart';

class BookedmarkScreen extends StatefulWidget {
  const BookedmarkScreen({super.key});

  @override
  State<BookedmarkScreen> createState() => _BookedmarkScreenState();
}

class _BookedmarkScreenState extends State<BookedmarkScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      body: Center(
        child: Text("BookedmarkScreen"),
      ),
    ));
  }
}
