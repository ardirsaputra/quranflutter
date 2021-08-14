part of 'models.dart';

class JadwalSholat extends Equatable{
  final String tanggal;
  final String hijri;
  final String imsak;
  final String subuh;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;
  final String lokasi;
 
  JadwalSholat({
    this.tanggal,
    this.hijri,
    this.imsak,
    this.subuh,
    this.dhuhr,
    this.asr,
    this.maghrib,
    this.isha,
    this.lokasi,
  });
   JadwalSholat copywith({
    String tanggal,
    String hijri,
    String imsak,
    String subuh,
    String dhuhr,
    String asr,
    String maghrib,
    String isha,
    String lokasi,
  }){
      return JadwalSholat(
        tanggal:  tanggal ?? this.tanggal,
        hijri:  hijri ?? this.hijri,
        imsak:  imsak ?? this.imsak,
        subuh:  subuh ?? this.subuh,
        dhuhr:  dhuhr ?? this.dhuhr,
        asr:  asr ?? this.asr,
        maghrib:  maghrib ?? this.maghrib,
        isha:  isha ?? this.isha,
        lokasi:  lokasi ?? this.lokasi,
      );
    }

  @override
  // TODO: implement props
  List<Object> get props => [
    tanggal,hijri,imsak,subuh,dhuhr,asr,maghrib,isha,lokasi
  ];
   factory JadwalSholat.fromJson(Map<String, dynamic> data) {
    return JadwalSholat(
        tanggal:  data['results']['datetime'][0]['date']['gregorian'].toString(),
        hijri:  data['results']['datetime'][0]['date']['hijri'].toString(),
        imsak:   data['results']['datetime'][0]['times']['Imsak'].toString(),
        subuh:   data['results']['datetime'][0]['times']['Fajr'].toString(),
        dhuhr:  data['results']['datetime'][0]['times']['Dhuhr'].toString(),
        asr:   data['results']['datetime'][0]['times']['Asr'].toString(),
        maghrib:   data['results']['datetime'][0]['times']['Maghrib'].toString(),
        isha:   data['results']['datetime'][0]['times']['Isha'].toString(),
        lokasi:   data['results']['location']['city'],
    );
  }
}
