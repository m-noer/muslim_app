class SurahModel {
  final int id;
  final String nama;
  final String asma;
  final int ayat;
  final String arti;

  SurahModel({this.id, this.nama, this.asma, this.ayat, this.arti});

  factory SurahModel.fromJson(Map<String, dynamic> json) {
    return SurahModel(
      id: json['id'],
      nama: json['surat_name'],
      asma: json['surat_text'],
      ayat: json['count_ayat'],
      arti: json['surat_terjemahan'],
    );
  }
}
