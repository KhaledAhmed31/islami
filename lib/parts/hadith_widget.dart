import 'package:flutter/material.dart';
import 'package:islamy/models/hadith_model.dart';
import 'package:islamy/utilities/assets.dart';
import 'package:islamy/utilities/my_colors.dart';

class HadithWidget extends StatefulWidget {
  const HadithWidget({super.key, required this.hadith});
  final String hadith;
  @override
  State<HadithWidget> createState() => _HadithWidgetState();
}

class _HadithWidgetState extends State<HadithWidget> {
  HadithModel myHadith = HadithModel(name: '', content: '');
  @override
  Widget build(BuildContext context) {
    if (myHadith.name.isEmpty) getHadith(widget.hadith);
    return Container(
      width: MediaQuery.sizeOf(context).width * .75,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: MyColors.primaryLightColor,
          image: const DecorationImage(
              fit: BoxFit.fill, image: AssetImage(Assets.hadithWidget))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 15),
            child: Text(
              myHadith.name,
              style: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
                child: myHadith.name.isEmpty
                    ? const CircularProgressIndicator(
                        color: Colors.black,
                      )
                    : Text(
                        myHadith.content,
                        textAlign: TextAlign.center,
                        textDirection: TextDirection.rtl,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      )),
          )
        ],
      ),
    );
  }

  void getHadith(String hadith) async {
    String name = hadith.trim().substring(0, hadith.trim().indexOf('\n'));
    String content = hadith.trim().substring(hadith.trim().indexOf('\n') + 1);
    myHadith.name = name;
    myHadith.content = content;
    setState(() {});
  }
}
