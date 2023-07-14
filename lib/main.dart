import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

bool? localizationval;
void main() async {
  localizationval = await SharedPreferenceService().getdata();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  static void setlocal(BuildContext context, Locale locale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setlocal(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  Locale? _locale;
  setlocal(Locale locale) {
    setState(() {
      if (localizationval == true) {
        _locale = Locale('no');
      } else {
        _locale = Locale('en');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // return MultiProvider(
    //   providers: [
    //     //  Provider<DateTimeModel>(create: (_) => DateTimeModel()),
    //   ],
    //   child: MaterialApp(
    //     home: SplashScreen(),
    //     debugShowCheckedModeBanner: false,
    //   ),
    // );
    LocalJsonLocalization.delegate.directories = ['lib/l10n'];
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
