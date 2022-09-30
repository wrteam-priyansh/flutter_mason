import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';

Future<void> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  //Register the licence of font
  //If using google-fonts
  // LicenseRegistry.addLicense(() async* {
  //   final license = await rootBundle.loadString('google_fonts/OFL.txt');
  //   yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  // });

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.light));

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  //if firebase is enable then uncomment this
  //await Firebase.initializeApp();

  await Hive.initFlutter();
  await Hive.openBox(authBoxKey);

  await Hive.openBox(settingsBoxKey);

  runApp(const MyApp());
}

class GlobalScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AppLocalizationCubit>(
            create: (_) => AppLocalizationCubit(SettingsRepository())),
        BlocProvider<AuthCubit>(create: (_) => AuthCubit(AuthRepository())),
      ],
      child: Builder(builder: (context) {
        final currentLanguage =
            context.watch<AppLocalizationCubit>().state.language;

        return MaterialApp(
          theme: Theme.of(context).copyWith(
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
              scaffoldBackgroundColor: pageBackgroundColor,
              colorScheme: Theme.of(context).colorScheme.copyWith(
                    primary: primaryColor,
                    onPrimary: onPrimaryColor,
                    secondary: secondaryColor,
                    background: backgroundColor,
                    error: errorColor,
                    onSecondary: onSecondaryColor,
                    onBackground: onBackgroundColor,
                  )),
          builder: (context, widget) {
            return ScrollConfiguration(
                behavior: GlobalScrollBehavior(), child: widget!);
          },
          locale: currentLanguage,
          localizationsDelegates: [
            AppLocalization.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: appLanguages.map((appLanguage) {
            return UiUtils.getLocaleFromLanguageCode(appLanguage.languageCode);
          }).toList(),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.splash,
          onGenerateRoute: Routes.onGenerateRouted,
        );
      }),
    );
  }
}
