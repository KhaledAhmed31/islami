import 'package:flutter/material.dart';
import 'package:islamy/utilities/assets.dart';
import 'package:islamy/utilities/my_colors.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> zekr = ['سبحان الله', 'الحمد لله', 'الله اكبر', 'سبحان الله'];
  String currentZekr = 'سبحان الله';
  int sebhaCount = 1;
  double rotationAngle = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.sebhaBackground), fit: BoxFit.cover)),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * .4,
          ),
          Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: -60,
                  child: Image.asset(
                    scale: 1.2,
                    Assets.sebhaHead,
                    fit: BoxFit.contain,
                  ),
                ),
                RotationTransition(
                    turns: AlwaysStoppedAnimation(rotationAngle),
                    child: GestureDetector(
                      onTap: () => useSebha(),
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width * .75,
                        child: Image.asset(
                          Assets.sebhaBody,
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
                Text(
                  '${sebhaCount - 1}',
                  style: const TextStyle(
                      color: MyColors.primaryLightColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                )
              ]),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: TextButton(
              onPressed: () {
                useSebha();
              },
              child: Text(
                currentZekr,
                style: const TextStyle(
                    color: MyColors.primaryLightColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void useSebha() {
    if (sebhaCount == 33) {
      sebhaCount = 1;
      rotationAngle = 0;
      setCurrentZekr();
    } else {
      rotationAngle += 10.909;
      sebhaCount += 1;
    }
    setState(() {});
  }

  void setCurrentZekr() {
    currentZekr = zekr[zekr.indexOf(currentZekr) + 1];
  }
}
