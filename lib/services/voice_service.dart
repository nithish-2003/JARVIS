import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class VoiceService {
  static final VoiceService _instance = VoiceService._internal();
  factory VoiceService() => _instance;
  VoiceService._internal();

  final SpeechToText _speech = SpeechToText();
  final FlutterTts _tts = FlutterTts();

  Future<void> initialize() async {
    await _speech.initialize();
    await _tts.setLanguage("en-US");
    await _tts.setPitch(1.0);
    await _tts.setSpeechRate(0.9);
  }

  Future<void> speak(String text) async {
    await _tts.speak(text);
  }

  Future<bool> startListening(Function(String) onResult) async {
    if (!await _speech.initialize()) {
      return false;
    }

    await _speech.listen(
      onResult: (result) {
        if (result.finalResult) {
          onResult(result.recognizedWords);
        }
      },
    );
    return true;
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }
}
