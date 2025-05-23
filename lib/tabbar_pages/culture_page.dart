

import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/components/index.dart';

class CulturePage extends StatefulWidget {
  const CulturePage({super.key});

  @override
  State<CulturePage> createState() => _CulturePageState();
}

class _CulturePageState extends State<CulturePage> {
  @override
  Widget build(BuildContext context) {
    return OceanPage(
      child: Container(
        child: Text('文创'),
      )
    );
  }
}