import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'package:flutter_shoppingcart/widgets/champion_detail.dart';

class ChampionCompareScreen extends StatefulWidget {
  final ChampionDetail champion1;
  final ChampionDetail champion2;

  const ChampionCompareScreen({
    super.key,
    required this.champion1,
    required this.champion2,
  });

  @override
  State<ChampionCompareScreen> createState() => _ChampionCompareScreenState();
}

class _ChampionCompareScreenState extends State<ChampionCompareScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "챔피언 비교: ${widget.champion1.name} vs ${widget.champion2.name}",
        ),
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          _buildComparisonItem("이름", widget.champion1.name, widget.champion2.name),
          _buildComparisonItem("가격", widget.champion1.price, widget.champion2.price),
          _buildComparisonItem("평점", widget.champion1.rate.toString(), widget.champion2.rate.toString()),
          _buildComparisonItem("리뷰 수", widget.champion1.review.toString(), widget.champion2.review.toString()),
          const SizedBox(height: 20),
          _buildButton(),
        ],
      ),
    );
  }

  Widget _buildComparisonItem(String title, String value1, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical
      padding: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  value1,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 5),
                Text(
                  value2,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kAccentColor,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "돌아가기",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
