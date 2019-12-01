class AyaModel {
  final int ayaNumber;
  final String ayaText;
  final String translation;
  AyaModel({this.ayaNumber, this.ayaText, this.translation});

  factory AyaModel.fromJson(Map<String, dynamic> json) {
    return AyaModel(
      ayaNumber: json['aya_number'],
      ayaText: json['aya_text'],
      translation: json['translation_aya_text'],
    );
  }
}
