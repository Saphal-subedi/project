import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

bool? localizationval;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  localizationval = await SharedPreferenceService().getdata();
  debugPrint(localizationval.toString());

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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
    setState(() {});
  }

  Locale checkLang() {
    if (localizationval == true) {
      return _locale = const Locale("no");
    } else {
      return _locale = const Locale("en");
    }
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
      locale: checkLang(),
      theme: ThemeData(
        primaryColor: Colors.red,
        appBarTheme: AppBarTheme(
          elevation: 2.0,
          backgroundColor: Colors.orange,
        ),
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
