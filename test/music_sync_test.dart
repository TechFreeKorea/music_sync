import 'package:flutter_test/flutter_test.dart';
import 'package:music_sync/music_sync.dart';
import 'package:music_sync/music_sync_platform_interface.dart';
import 'package:music_sync/music_sync_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMusicSyncPlatform
    with MockPlatformInterfaceMixin
    implements MusicSyncPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MusicSyncPlatform initialPlatform = MusicSyncPlatform.instance;

  test('$MethodChannelMusicSync is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMusicSync>());
  });

  test('getPlatformVersion', () async {
    MusicSync musicSyncPlugin = MusicSync();
    MockMusicSyncPlatform fakePlatform = MockMusicSyncPlatform();
    MusicSyncPlatform.instance = fakePlatform;

    expect(await musicSyncPlugin.getPlatformVersion(), '42');
  });
}
