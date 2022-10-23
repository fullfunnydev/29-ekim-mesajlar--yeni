import 'package:assets_audio_player/assets_audio_player.dart';

AssetsAudioPlayer playSound = AssetsAudioPlayer();

class sesleri_oynat {
  static ses_CAL(String muzik_PATH_PATH) {
    playSound.open(Audio(muzik_PATH_PATH));
  }
}
