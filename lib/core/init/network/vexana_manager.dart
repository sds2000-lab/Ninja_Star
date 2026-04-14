import 'dart:io';
import 'package:vexana/vexana.dart';
import 'empty_model.dart' as app;

class VexanaManager {
  VexanaManager._init();
  static VexanaManager? _instance;

  static VexanaManager get instance {
    _instance ??= VexanaManager._init();
    return _instance!;
  }

  static const String _iosBaseUrl = 'http://localhost:3000/';
  static const String _androidBaseUrl = 'http://10.0.2.2:3000/';

  late final INetworkManager<app.EmptyModel> networkManager =
  NetworkManager<app.EmptyModel>(
    isEnableLogger: true,
    options: BaseOptions(
      baseUrl: Platform.isAndroid ? _androidBaseUrl : _iosBaseUrl,
    ),
  );
}