import 'package:flutter_test/flutter_test.dart';
import 'package:vftools/vftools.dart';
import 'package:vftools/plugin/vftools_platform.dart';
import 'package:vftools/plugin/vftools_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockVFToolsPlatform
    with MockPlatformInterfaceMixin
    implements VFToolsPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final VFToolsPlatform initialPlatform = VFToolsPlatform.instance;

  test('$VFToolsChannel is the default instance', () {
    expect(initialPlatform, isInstanceOf<VFToolsChannel>());
  });

  test('getPlatformVersion', () async {
    MockVFToolsPlatform fakePlatform = MockVFToolsPlatform();
    VFToolsPlatform.instance = fakePlatform;

    expect(await VFToolsPlatform.instance.getPlatformVersion(), '42');
  });
}
