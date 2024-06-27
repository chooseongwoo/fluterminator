import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final String username, content;
  final int rate;
  const ReviewWidget({
    super.key,
    required this.username,
    required this.content,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 218, 212, 212),
      ),
      padding: const EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width,
      height: 112,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            username,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          Text(content),
        ],
      ),
    );
  }
}
