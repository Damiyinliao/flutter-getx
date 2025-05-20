import 'package:flutter/material.dart';

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      clipBehavior: Clip.none,
      children: [
        Container(
          color: Colors.amber,
          width: 300,
          height: 300,
        ),
        Container(
          color: Colors.blue,
          width: 200,
          height: 200,
        ),
        Container(
          color: Colors.green,
          width: 100,
          height: 100,
        ),
        const Positioned(
          left: 250,
          top: 50,
          child: FlutterLogo(size: 100)
        )
      ]
    );
  }
}