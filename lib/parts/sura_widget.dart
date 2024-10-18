import 'package:flutter/material.dart';
import 'package:islamy/models/Quran_model.dart';
import 'package:islamy/screens/home.dart';
import 'package:islamy/screens/quran_screen.dart';
import 'package:islamy/utilities/assets.dart';

class SuraWidget extends StatelessWidget {
  final int suraNumber;
  const SuraWidget({super.key, required this.suraNumber});

  @override
  Widget build(BuildContext context) {
    String suraName = HomeState.suraNames[suraNumber];
    int versesNumber = HomeState.versesNumber[suraNumber];
    return ListTile(
      dense: true,
      enableFeedback: true,
      leading: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            Assets.suraIcon,
            color: Theme.of(context).primaryColor,
          ),
          Text(
            (suraNumber + 1).toString(),
            style: const TextStyle(color: Colors.white, fontSize: 15),
          )
        ],
      ),
      title: Text(
        suraName,
        style: const TextStyle(
            color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
      ),
      trailing: Text(
        textDirection: TextDirection.rtl,
        "$versesNumber ايات",
        style: const TextStyle(color: Colors.white, fontSize: 18),
      ),
      onTap: () => Navigator.of(context).pushNamed(QuranScreen.routeName,
          arguments: QuranModel(
              suraName: suraName,
              versesNumber: versesNumber,
              suraNumber: (suraNumber + 1))),
    );
  }
}
