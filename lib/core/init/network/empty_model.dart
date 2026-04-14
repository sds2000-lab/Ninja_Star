import 'package:vexana/vexana.dart';

class EmptyModel extends INetworkModel<EmptyModel> {
  @override
  EmptyModel fromJson(Map<String, dynamic> json) => EmptyModel();

  @override
  Map<String, dynamic>? toJson() => {};
}