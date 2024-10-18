import 'package:flutter/material.dart';
import 'package:islamy/utilities/assets.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({super.key});

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool play = true;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: MediaQuery.sizeOf(context).height * .3,
        width: MediaQuery.sizeOf(context).width * .9,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: AssetImage(Assets.radioWidget), fit: BoxFit.cover)),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Chanel name',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_previous_rounded)),
                IconButton(
                    onPressed: () {
                      setState(() {
                        play = !play;
                      });
                    },
                    icon: play
                        ? const Icon(Icons.play_arrow_rounded)
                        : const Icon(Icons.pause)),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.skip_next_rounded)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
