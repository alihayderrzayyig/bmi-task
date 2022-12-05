import 'package:flutter/material.dart';

class RCard extends StatelessWidget {
  const RCard({
    Key? key,
    required this.title,
    required this.color,
    required this.onPress,
  }) : super(key: key);

  final String title;
  final Color color;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(fontSize: 40),
        ),
      ),
    );
  }
}
