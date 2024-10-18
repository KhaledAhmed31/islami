import 'package:flutter/material.dart';
import 'package:islamy/provider/locale_provider.dart';
import 'package:islamy/utilities/my_theme.dart';
import 'package:islamy/screens/home.dart';
import 'package:islamy/screens/quran_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(ChangeNotifierProvider<LocaleProvider>(
    create: (context) => LocaleProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      title: "Islami",
      locale: Locale(Provider.of<LocaleProvider>(context).locale),
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routename: (_) => const Home(),
        QuranScreen.routeName: (_) => const QuranScreen()
      },
      theme: MyTheme.lightTheme,
    );
  }
}
