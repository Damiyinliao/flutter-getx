import 'package:flutter/material.dart';

class FlexPage extends StatelessWidget {
  const FlexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            color: Colors.grey,
          )
        ),
        const FlutterLogo(
          size: 100,
        )
        // Expanded(
        //   flex: 1,
        //   child: FlutterLogo(size: 200)
        // )
      ]
    );
  }
}