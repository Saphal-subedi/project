import 'package:e_woda/HamroServices/birth_page.dart';
import 'package:e_woda/HamroServices/marriage_page.dart';
import 'package:e_woda/Shared%20Preferences/shared_preferences_services.dart';
import 'package:e_woda/SuperAdminPage/super_admin.dart';
import 'package:e_woda/YYY/prasiddha.dart';
import 'package:e_woda/core/resources/app_theme.dart';
import 'package:e_woda/core/routes/routes_config.dart';
import 'package:e_woda/features/HomePage/home_page.dart';
import 'package:e_woda/features/authentication/User%20Login%20Page/login_user_page.dart';
import 'package:e_woda/provider/loading_provider.dart';
import 'package:e_woda/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
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
  // ignore: unused_field
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
    LocalJsonLocalization.delegate.directories = ['lib/l10n'];
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => LoadinProvider(),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: checkLang(),
        theme: AppTheme.appThemeData,
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.generateRoutes,
      ),
    );
  }
}
