class AudioModel {
  final String audio;

  AudioModel({this.audio});

  factory AudioModel.fromJson(Map json) {
    return AudioModel(audio: json['data']['audioSecondary']);
  }
}
