
import 'package:flutter/material.dart';
import 'package:flutter_woo_2025/common/components/index.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return OceanPage(
      child: Container(
        child: Text('订单'),
      )
    );
  }
}