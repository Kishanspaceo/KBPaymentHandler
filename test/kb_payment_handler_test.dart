import 'package:flutter_test/flutter_test.dart';
import 'package:kb_payment_handler/kb_payment_handler.dart';
import 'package:kb_payment_handler/kb_payment_handler_platform_interface.dart';
import 'package:kb_payment_handler/kb_payment_handler_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKbPaymentHandlerPlatform
    with MockPlatformInterfaceMixin
    implements KbPaymentHandlerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final KbPaymentHandlerPlatform initialPlatform = KbPaymentHandlerPlatform.instance;

  test('$MethodChannelKbPaymentHandler is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKbPaymentHandler>());
  });

  test('getPlatformVersion', () async {
    KbPaymentHandler kbPaymentHandlerPlugin = KbPaymentHandler();
    MockKbPaymentHandlerPlatform fakePlatform = MockKbPaymentHandlerPlatform();
    KbPaymentHandlerPlatform.instance = fakePlatform;

    expect(await kbPaymentHandlerPlugin.getPlatformVersion(), '42');
  });
}
