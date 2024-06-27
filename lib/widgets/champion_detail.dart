import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'package:flutter_shoppingcart/screens/champion_compare_screen.dart';
import 'package:flutter_shoppingcart/screens/reviews_screen.dart';

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
    return SingleChildScrollView(
      child: Container(
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
              _buildDetailRatingAndReviewCount(context),
              _buildDetailColorOptions(),
              _buildSelectChampionButton(context),
              const SizedBox(height: 20), // Add spacing between buttons
              _buildCompareChampionButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailNameAndPrice() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
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

  Widget _buildDetailRatingAndReviewCount(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          if (rate >= 1 && rate <= 5)
            for (int i = 0; i < rate; i++)
              const Icon(Icons.star, color: Colors.yellow)
          else
            for (int i = 0; i < 3; i++)
              const Icon(Icons.star, color: Colors.yellow),
          const Spacer(),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ReviewsScreen(
                    name: name,
                  ),
                ),
              );
            },
            child: Row(
              children: [
                const Text("review "),
                Text("($review)", style: const TextStyle(color: Colors.blue)),
              ],
            ),
          ),
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

  Widget _buildDetailIcon(Color color) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
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
                color: color,
                width: 40,
                height: 40,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSelectChampionButton(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
          onPressed: () {
            _showSelectChampionDialog(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            "챔피언 선택하기",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _buildCompareChampionButton(BuildContext context) {
    return Align(
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextButton(
          onPressed: () {
            _showCompareChampionDialog(context);
          },
          style: TextButton.styleFrom(
            backgroundColor: kAccentColor,
            minimumSize: const Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text(
            "다른 챔피언과 비교하기",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }

  void _showSelectChampionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("챔피언을 선택하시겠습니까?"),
        actions: [
          TextButton(
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
  }

  void _showCompareChampionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("비교할 챔피언 선택"),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              4, // Assuming there are 4 champions for simplicity
              (index) => ListTile(
                title: Text(championNames[index]), // Using direct names here
                onTap: () {
                  Navigator.pop(context); // Close the dialog
                  _navigateToCompareScreen(context, index);
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToCompareScreen(BuildContext context, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChampionCompareScreen(
          champion1: this,
          champion2: ChampionDetail(
            name: championNames[index], // Using direct name
            price: championPrices[index], // Using direct price
            rate: championRates[index], // Using direct rate
            review: championReviews[index], // Using direct review count
          ),
        ),
      ),
    );
  }
}

// Assuming champion names, prices, rates, and reviews are defined somewhere
List<String> championNames = [
  "야스오",
  "리 신",
  "티모",
  "블리츠크랭크",
];

List<String> championPrices = [
  "6400",
  "4800",
  "1350",
  "3150",
];

List<int> championRates = [
  5,
  4,
  1,
  3,
];

List<int> championReviews = [
  1439,
  853,
  382,
  623,
];
