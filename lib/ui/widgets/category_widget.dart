import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  const CategoryWidget({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Chip(
        side: BorderSide.none,
        backgroundColor: const Color(0xffEFF2F9),
        label: Text(
          textAlign: TextAlign.center,
          text,
          style: const TextStyle(
            height: 1,
            color: Colors.blue,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
