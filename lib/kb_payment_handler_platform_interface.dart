import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'kb_payment_handler_method_channel.dart';

abstract class KbPaymentHandlerPlatform extends PlatformInterface {
  /// Constructs a KbPaymentHandlerPlatform.
  KbPaymentHandlerPlatform() : super(token: _token);

  static final Object _token = Object();

  static KbPaymentHandlerPlatform _instance = MethodChannelKbPaymentHandler();

  /// The default instance of [KbPaymentHandlerPlatform] to use.
  ///
  /// Defaults to [MethodChannelKbPaymentHandler].
  static KbPaymentHandlerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KbPaymentHandlerPlatform] when
  /// they register themselves.
  static set instance(KbPaymentHandlerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
