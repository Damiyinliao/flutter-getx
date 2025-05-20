import 'package:flutter/material.dart';

class RowColumnPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return Container(
    //   color: Colors.amber,
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: const [
    //       FlutterLogo(size: 100),
    //       FlutterLogo(size: 200),
    //       FlutterLogo(size: 100),
    //     ],
    //   )
    // );
    return Container(
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: const [
          FlutterLogo(size: 100),
          FlutterLogo(size: 200),
          FlutterLogo(size: 100),
        ],
      )
    );
  }

}