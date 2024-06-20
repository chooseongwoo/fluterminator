import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/widgets/review_widget.dart';

class ReviewsScreen extends StatelessWidget {
  final String name;
  const ReviewsScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "리뷰",
        ),
        backgroundColor: Colors.yellow,
      ),
      backgroundColor: Colors.white,
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
          ReviewWidget(username: "추성우", content: "너무 재미있네요!!!", rate: 5),
        ],
      ),
    );
  }
}
