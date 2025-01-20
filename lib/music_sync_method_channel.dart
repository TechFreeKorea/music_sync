import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'music_sync_platform_interface.dart';

/// An implementation of [MusicSyncPlatform] that uses method channels.
class MethodChannelMusicSync extends MusicSyncPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('music_sync');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
