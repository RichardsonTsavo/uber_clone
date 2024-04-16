import 'package:asuka/asuka.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    Modular.setObservers([Asuka.asukaHeroController]);
    return MaterialApp.router(
      title: 'Uber Clone',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: "uber",
        colorScheme: ColorScheme.fromSeed(
          background: Colors.white,
          seedColor: Colors.black,
        ).copyWith(
          primary: Colors.black,
        ),
      ),
      builder: (context, child) => Asuka.builder(context, child),
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
    );
  }
}
