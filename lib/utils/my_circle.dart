import 'package:flutter/material.dart';

class MyCircle extends StatelessWidget {
  const MyCircle({super.key,required this.imagePath});
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      height: 60,
      width: 60,
      decoration:
          BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 0.4,color: Theme.of(context).colorScheme.primary)),
      child: Image.asset(imagePath),
    );
  }
}
