import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.general.colorScheme.surface,
      body: Center(
        child: AnimatedOpacity(
          opacity: 1,
          duration: const Duration(milliseconds: 500),
          child: Text(
            LocaleKeys.splash_welcome.tr(),
            style: context.general.textTheme.headlineMedium,
          ),
        ),
      ),
    );
  }
}