// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'package:flutter/services.dart';

class KbPaymentHandler {
  static const MethodChannel _channel = MethodChannel('kb_payment_handler');

  static Future<String> getPlatformMessage() async {
    final String message = await _channel.invokeMethod('getPlatformMessage');
    return message;
  }
}
