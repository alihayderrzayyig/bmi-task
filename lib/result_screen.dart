import 'dart:math';

import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key, required this.tall, required this.weight})
      : super(key: key);
  final int tall;
  final double weight;

  @override
  // double wi = pow((tall / 100), 2);
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Result"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            color: Colors.indigo,
            borderRadius: BorderRadius.circular(10),
          ),
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Your BMI is:",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                (weight / pow((tall / 100), 2)).toStringAsFixed(2),
                style: const TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
