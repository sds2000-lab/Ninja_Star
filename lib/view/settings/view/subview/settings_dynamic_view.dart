import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:fluttermvvmtemplate/core/constants/app/app_constants.dart';
import 'package:fluttermvvmtemplate/view/settings/model/settings_dynamic.dart';

class SettingsDynamicView extends StatelessWidget {
  const SettingsDynamicView({super.key, required this.model});

  final SettingsDynamicModel model;

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(model.url ?? ApplicationConstants.APP_WEB_SITE),
      );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          model.title,
          style: context.general.textTheme.titleSmall,
        ),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}