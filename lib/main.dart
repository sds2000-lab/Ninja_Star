import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_route.dart';
import 'package:fluttermvvmtemplate/core/init/navigation/navigation_service.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/provider_list.dart';
import 'package:fluttermvvmtemplate/core/init/notifier/theme_notifer.dart';
import 'package:provider/provider.dart';

import 'view/home/home_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [...ApplicationProvider.instance.dependItems],
      child: EasyLocalization(
        supportedLocales: const [Locale('he')],
        path: ApplicationConstants.LANG_ASSET_PATH,
        startLocale: const Locale('he'),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: context.watch<ThemeNotifier>().currentTheme,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      builder: (context, child) {
        return Directionality(
          textDirection: ui.TextDirection.rtl,
          child: child!,
        );
      },

      navigatorKey: NavigationService.instance.navigatorKey,
      onGenerateRoute: NavigationRoute.instance.generateRoute,

      home: const HomeView(),
    );
  }
}