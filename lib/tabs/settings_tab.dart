import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        decoration:
            const BoxDecoration(color: Color.fromARGB(255, 213, 185, 135)),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  AppLocalizations.of(context)!.languege,
                  style: Theme.of(context).textTheme.bodyLarge,
                )),
                DropdownButton<String>(
                  value: Provider.of<LocaleProvider>(context).gatLang(),
                  borderRadius: BorderRadius.circular(20),
                  items: [
                    DropdownMenuItem<String>(
                      value: "ar",
                      child: Text(
                        AppLocalizations.of(context)!.arabic,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "en",
                      child: Text(
                        AppLocalizations.of(context)!.english,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    )
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      Provider.of<LocaleProvider>(context, listen: false)
                          .changeLocale(value);
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
