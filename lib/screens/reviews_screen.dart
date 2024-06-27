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
          ReviewWidget(username: "김철수", content: "가렌은 정말 튼튼한 탱커입니다.", rate: 5),
          ReviewWidget(
              username: "박영희", content: "아리의 매혹 스킬은 정말 강력해요!", rate: 2),
          ReviewWidget(username: "이민호", content: "야스오는 너무 어려워요", rate: 3),
          ReviewWidget(
              username: "최지수", content: "럭스의 궁극기는 정말 시원시원하네요.", rate: 4),
          ReviewWidget(username: "정현우", content: "티모의 독 데미지는 굉장합니다.", rate: 5),
          ReviewWidget(username: "박준영", content: "리 신의 플레이는 항상 짜릿해요.", rate: 1),
        ],
      ),
    );
  }
}
