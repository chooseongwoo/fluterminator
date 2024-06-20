import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';

class ChampionDetail extends StatelessWidget {
  final String name, price;
  final int rate, review;

  const ChampionDetail({
    super.key,
    required this.name,
    required this.price,
    required this.rate,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailNameAndPrice(),
            _buildDetailRatingAndReviewCount(),
            _buildDetailColorOptions(),
            _buildDetailButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        // 1. spaceBetween 이 적용되면 양 끝으로 벌어진다.
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "\$$price",
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailRatingAndReviewCount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          if (rate >= 1 && rate <= 5)
            for (num i = 0; i < rate; i++)
              const Icon(Icons.star, color: Colors.yellow)
          else
            for (num i = 0; i < 3; i++)
              const Icon(Icons.star, color: Colors.yellow),
          // 2. Spacer()로 Icon위젯과 Text위젯을 양끝으로 벌릴 수 있다. spaceBetween과 동일
          const Spacer(),
          const Text("review "),
          Text("($review)", style: const TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget _buildDetailColorOptions() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Skin Options"),
          const SizedBox(height: 10),
          Row(
            children: [
              // 3. 동일한 색상 아이콘을 재사용하기 위해 함수로 관리
              _buildDetailIcon(Colors.black),
              _buildDetailIcon(Colors.red),
              _buildDetailIcon(Colors.blue),
              _buildDetailIcon(Colors.orange),
              _buildDetailIcon(Colors.white),
            ],
          ),
        ],
      ),
    );
  }

  // 4. 다른 화면에서도 재사용하면 공통 컴포넌트 위젯으로 관리하는 것이 좋다.
  Widget _buildDetailIcon(Color mColor) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      // 5. Stack의 첫 번째 Container 위젯위에 Positioned 위젯이 올라가는 형태
      child: Stack(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(),
              shape: BoxShape.circle,
            ),
          ),
          Positioned(
            left: 5,
            top: 5,
            child: ClipOval(
              child: Container(
                color: mColor,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  // 6. 다른 화면에서도 재사용하려면 함수가 아닌 공통 컴포넌트 위젯으로 관리하는 것이 좋다.
  Widget _buildDetailButton(BuildContext context) {
    return Align(
      child: TextButton(
        onPressed: () {
          showCupertinoDialog(
            // 1. 추가
            context: context,
            builder: (context) => CupertinoAlertDialog(
              title: const Text("챔피언을 선택하시겠습니까?"),
              actions: [
                CupertinoDialogAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "확인",
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
              ],
            ),
          );
        },
        style: TextButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: const Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Pick Champion",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
