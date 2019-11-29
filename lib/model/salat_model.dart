class SalatModel {
  final String fajr;
  final String shurooq;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  SalatModel(
      {this.fajr, this.shurooq, this.dhuhr, this.asr, this.maghrib, this.isha});

  factory SalatModel.fromJson(Map<String, dynamic> json) {
    return SalatModel(
      fajr: json['fajr'],
      shurooq: json['shurooq'],
      dhuhr: json['dhuhr'],
      asr: json['asr'],
      maghrib: json['maghrib'],
      isha: json['isha'],
    );
  }
}
