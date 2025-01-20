import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'music_sync_method_channel.dart';

abstract class MusicSyncPlatform extends PlatformInterface {
  /// Constructs a MusicSyncPlatform.
  MusicSyncPlatform() : super(token: _token);

  static final Object _token = Object();

  static MusicSyncPlatform _instance = MethodChannelMusicSync();

  /// The default instance of [MusicSyncPlatform] to use.
  ///
  /// Defaults to [MethodChannelMusicSync].
  static MusicSyncPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MusicSyncPlatform] when
  /// they register themselves.
  static set instance(MusicSyncPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
