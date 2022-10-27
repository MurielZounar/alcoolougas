import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Image.asset(
          'assets/images/aog-white.png',
          height: 100,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Álcool ou Gasolina',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Big Shouldes Display',
            fontSize: 35,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
