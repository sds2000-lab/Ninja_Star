import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fluttermvvmtemplate/core/init/lang/locale_keys.g.dart';

class TestsView extends StatelessWidget {
  const TestsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.welcome.tr(),
            style: context.general.textTheme.titleMedium),
      ),
      body: Center(
        child: Text(
          LocaleKeys.welcome.tr(),
          style: context.general.textTheme.headlineSmall,
        ),
      ),
    );
  }
}