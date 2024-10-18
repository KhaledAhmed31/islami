import 'package:flutter/material.dart';
import 'package:islamy/parts/sura_widget.dart';
import 'package:islamy/screens/home.dart';
import 'package:islamy/utilities/assets.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.background), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .2,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return SuraWidget(suraNumber: index);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Theme.of(context).primaryColor,
                    thickness: 2,
                    height: 20,
                    endIndent: 60,
                    indent: 60,
                  );
                },
                itemCount: HomeState.suraNames.length),
          )
        ],
      ),
    );
  }
}
