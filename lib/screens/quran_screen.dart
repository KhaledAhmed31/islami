import 'package:flutter/material.dart';
import 'package:islamy/models/Quran_model.dart';
import 'package:islamy/screens/home.dart';
import 'package:islamy/utilities/assets.dart';
import 'package:islamy/utilities/my_colors.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatefulWidget {
  static const String routeName = 'QuranScreen';
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  String suraContent = '';
  int versesNumber = 0;
  @override
  Widget build(BuildContext context) {
    QuranModel suraData =
        ModalRoute.of(context)!.settings.arguments as QuranModel;
    versesNumber = suraData.versesNumber;
    if (suraContent.isEmpty) getSuraContent(suraData.suraNumber);

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(Assets.quranBackground))),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: Navigator.of(context).pop,
              icon: const Icon(
                size: 25,
                Icons.arrow_back_ios,
                color: MyColors.primaryLightColor,
              )),
          title: Text(
              " ${suraData.suraNumber} ${AppLocalizations.of(context)!.suraNumber}  "),
          backgroundColor: const Color(0xFF202020),
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(Assets.left),
                    Text(
                      suraData.suraName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: MyColors.primaryLightColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(Assets.right)
                  ],
                ),
              ),
              Text(
                'بسم الله الحمن الرحيم',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).primaryColor,
                    fontSize: 20,
                    letterSpacing: 1.5),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 6),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  height: MediaQuery.sizeOf(context).height * .62,
                  width: MediaQuery.sizeOf(context).width * .9,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(198, 23, 23, 23),
                      borderRadius: BorderRadius.circular(20)),
                  child: suraContent.isNotEmpty
                      ? SingleChildScrollView(
                          child: Text(
                          buildSuraStructure(suraContent),
                          textAlign: TextAlign.center,
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context).textTheme.titleMedium,
                        ))
                      : const Center(
                          child: CircularProgressIndicator(
                          color: MyColors.primaryLightColor,
                          strokeAlign: BorderSide.strokeAlignCenter,
                        ))),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {
                        if (suraData.suraNumber + 1 < 114) {
                          Navigator.of(context).pushReplacementNamed(
                              QuranScreen.routeName,
                              arguments: QuranModel(
                                  suraName:
                                      HomeState.suraNames[suraData.suraNumber],
                                  suraNumber: suraData.suraNumber + 1,
                                  versesNumber: HomeState
                                      .versesNumber[suraData.suraNumber + 1]));
                        }
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back_ios,
                            color: MyColors.primaryLightColor,
                          ),
                          Text(
                            AppLocalizations.of(context)!.nextSura,
                            style: const TextStyle(
                                color: MyColors.primaryLightColor),
                          ),
                        ],
                      )),
                  TextButton(
                      onPressed: () {
                        if (suraData.suraNumber - 1 > 0) {
                          Navigator.of(context).pushReplacementNamed(
                              QuranScreen.routeName,
                              arguments: QuranModel(
                                  suraName: HomeState
                                      .suraNames[suraData.suraNumber - 2],
                                  suraNumber: suraData.suraNumber - 1,
                                  versesNumber: HomeState
                                      .versesNumber[suraData.suraNumber - 2]));
                        }
                      },
                      child: Row(
                        children: [
                          Text(
                            textDirection: TextDirection.rtl,
                            AppLocalizations.of(context)!.lastSura,
                            style: const TextStyle(
                                color: MyColors.primaryLightColor),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: MyColors.primaryLightColor,
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void getSuraContent(int fileNeme) async {
    suraContent = await rootBundle.loadString('assets/suratext/$fileNeme.txt');
    setState(() {});
  }

  String buildSuraStructure(String suraContent) {
    List<String> splited = suraContent.split('\n');
    String result = '';
    for (int i = 0; i < splited.length; ++i) {
      result += ' ${splited[i]}{ ${i + 1} } ';
    }

    return result.trim();
  }
}
