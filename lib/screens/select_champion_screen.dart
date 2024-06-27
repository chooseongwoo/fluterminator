import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart/constants.dart';
import 'package:flutter_shoppingcart/widgets/champion_detail.dart';
import 'package:url_launcher/url_launcher.dart';

class SelectChampion extends StatefulWidget {
  const SelectChampion({super.key});

  @override
  State<SelectChampion> createState() => _SelectChampionState();
}

class _SelectChampionState extends State<SelectChampion> {
  int selectedId = 0;
  List<String> selectedPic = [
    "assets/yassuo.jpeg",
    "assets/leesin.jpeg",
    "assets/teemo.jpeg",
    "assets/blitz.jpeg",
  ];

  List<ChampionDetail> championList = [
    const ChampionDetail(name: "야스오", price: "6400", rate: 5, review: 1439),
    const ChampionDetail(name: "리 신", price: "4800", rate: 4, review: 853),
    const ChampionDetail(name: "티모", price: "1350", rate: 1, review: 382),
    const ChampionDetail(name: "블리츠크랭크", price: "3150", rate: 3, review: 623),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildShoppingCartAppBar(),
      body: Column(
        children: [
          buildHeaderPic(),
          buildHeaderSelector(),
          Expanded(
            child: championList[selectedId],
          ),
        ],
      ),
    );
  }

  AppBar _buildShoppingCartAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.computer_outlined),
          // onPressed: () async {
          // final url = Uri.parse('https://www.op.gg/');
          // if (await canLaunchUrl(url)) {
          //   launchUrl(url);
          // } else {
          //   // ignore: avoid_print
          //   print("Can't launch $url");
          //   }
          onPressed: () {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: ((context) {
                return AlertDialog(
                  title: const Text("OPGG로\n이동하시겠습니까?"),
                  actions: <Widget>[
                    SizedBox(
                      child: TextButton(
                        onPressed: () async {
                          final url = Uri.parse('https://www.op.gg/');
                          Navigator.of(context).pop();
                          if (await canLaunchUrl(url)) {
                            launchUrl(url);
                          } else {
                            // ignore: avoid_print
                            print("Can't launch $url");
                          }
                        },
                        child: const Text(
                          "ㅇ",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          "아니요",
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ),
                  ],
                );
              }),
            );
          },
        ),
        const SizedBox(width: 16),
      ],
      elevation: 0.0,
    );
  }

  Widget buildHeaderSelectorButton(int id, String champion) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: id == selectedId ? kAccentColor : kSecondaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextButton(
        child: Text(
          champion,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black,
          ),
        ),
        onPressed: () {
          setState(() {
            selectedId = id;
          });
        },
      ),
    );
  }

  Widget buildHeaderSelector() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildHeaderSelectorButton(0, "야스오"),
          buildHeaderSelectorButton(1, "리 신"),
          buildHeaderSelectorButton(2, "티모"),
          buildHeaderSelectorButton(3, "블리츠크랭크"),
        ],
      ),
    );
  }

  Widget buildHeaderPic() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: AspectRatio(
        aspectRatio: 5 / 3,
        child: Image.asset(
          selectedPic[selectedId],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
