import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            // color: Colors.amber,
            width: 300,
            height: 200,
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.black,
                width: 2
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black,
                  offset: Offset(0, 0),
                  blurRadius: 2,
                )
              ],
              image: const DecorationImage(
                image: NetworkImage('https://img.yzcdn.cn/vant/cat.jpeg'),
                fit: BoxFit.cover,
              )
            ),
            // foregroundDecoration: BoxDecoration(
            //   color: Colors.red.withOpacity(0.3)
            // ),
            child: const Text('Container')
          )
        ],
      ),
    );
  }
}