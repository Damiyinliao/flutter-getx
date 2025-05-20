import 'package:flutter/material.dart';

class AlignPage extends StatelessWidget {
  const AlignPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      widthFactor: 2,
      heightFactor: 2,
      child: Container(color: Colors.green, width: 100, height: 100)
    );
  }
}