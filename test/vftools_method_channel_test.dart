import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vftools/plugin/vftools_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  VFToolsChannel platform = VFToolsChannel();
  const MethodChannel channel = MethodChannel('vftools');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
