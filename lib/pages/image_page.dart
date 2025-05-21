import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/assets.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          for (var item in BoxFit.values) _buildFitImage(item)
        ],
      )
    );
  }

  Column _buildFitImage(fit) {
    return Column(
      children: [
        Text("$fit"),
        SizedBox(
          width: 100,
          height: 100,
          child: Image.asset(
            AssetsImages.logoPng,
            fit: fit
          )
        )
      ]
    );
  }
}