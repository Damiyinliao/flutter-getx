import 'package:flutter/material.dart';

class IconPage extends StatelessWidget {
  const IconPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Icon(
        Icons.campaign,
        size: 200,
        color: Colors.amber,
      ),
    );
  }
}

