import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/parts/hadith_widget.dart';
import 'package:islamy/utilities/assets.dart';

class HadithTab extends StatefulWidget {
  const HadithTab({super.key});

  @override
  State<HadithTab> createState() => _HadithTabState();
}

class _HadithTabState extends State<HadithTab> {
  List<String> ahadith = [];

  @override
  Widget build(BuildContext context) {
    if (ahadith.isEmpty) getAhadith();
    return Container(
      padding: const EdgeInsets.only(top: 250, bottom: 50),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
          color: Color(0xff202020),
          image: DecorationImage(
            image: AssetImage(Assets.hadithBackground),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          )),
      child: ListView.builder(
        controller: ScrollController(keepScrollOffset: true),
        scrollDirection: Axis.horizontal,
        itemCount: ahadith.length,
        itemBuilder: (context, index) {
          return ahadith.isEmpty
              ? const CircularProgressIndicator()
              : HadithWidget(
                  hadith: ahadith[index],
                );
        },
      ),
    );
  }

  void getAhadith() async {
    String allContent =
        await rootBundle.loadString('assets/hadith_text/ahadeth.txt');
    ahadith = allContent.trim().split('#');
    ahadith.removeWhere((element) => element.trim().isEmpty);
    setState(() {});
  }
}
