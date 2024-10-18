import 'package:flutter/material.dart';
import 'package:islamy/parts/radio_widget.dart';
import 'package:islamy/utilities/assets.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.radioBackground), fit: BoxFit.fill)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .5,
          ),
          const RadioWidget()
        ],
      ),
    );
  }
}
