import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'kb_payment_handler_platform_interface.dart';

/// An implementation of [KbPaymentHandlerPlatform] that uses method channels.
class MethodChannelKbPaymentHandler extends KbPaymentHandlerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('kb_payment_handler');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
