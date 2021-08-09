part of 'models.dart';

class Surat extends Equatable{
  final String nomor;
  final String arti;
  final String asma;
  final String audio;
  final int ayat;
  final String keterangan;
  final String nama;
  final String rukuk;
  final String type;
  final String urut;

  Surat({
    this.arti,
    this.asma,
    this.audio,
    this.ayat,
    this.keterangan,
    this.nama,
    this.nomor,
    this.rukuk,
    this.type,
    this.urut,
  });
   Surat copywith({
   String arti,
   String asma,
   String audio,
   int ayat,
   String keterangan,
   String nama,
   String nomor,
   String rukuk,
   String type,
   String urut,
  }){
      return Surat(
        arti:  arti ?? this.arti,
        asma:  asma ?? this.asma,
        audio:  audio ?? this.audio,
        ayat:  ayat ?? this.ayat,
        keterangan:  keterangan ?? this.keterangan,
        nama:  nama ?? this.nama,
        nomor:  nomor ?? this.nomor,
        rukuk:  rukuk ?? this.rukuk,
        type:  type ?? this.type,
        urut:  urut ?? this.urut,
      );
    }

  @override
  // TODO: implement props
  List<Object> get props => [
    arti,asma,audio,ayat,keterangan,nama,nomor,rukuk,type,urut
  ];
   factory Surat.fromJson(Map<String, dynamic> data) {
    return Surat(
        arti: data['arti'],
        asma: data['asma'],
        audio: data['audio'],
        ayat: data['ayat'],
        keterangan: data['keterangan'],
        nama: data['nama'],
        nomor: data['nomor'],
        rukuk: data['rukuk'],
        type: data['type'],
        urut: data['urut'],
    );
  }
}


Surat surat1  = Surat(
    arti: 'Pembukaan' ,
        asma: 'الفاتحة',
        audio: 'http://ia802609.us.archive.org/13/items/quraninindonesia/001AlFaatihah.mp3',
        ayat: 7,
        keterangan: "Surat <i>Al Faatihah</i> (Pembukaan) yang diturunkan di Mekah dan terdiri dari 7 ayat adalah surat yang pertama-tama diturunkan dengan lengkap  diantara surat-surat yang ada dalam Al Quran dan termasuk golongan surat Makkiyyah. Surat ini disebut <i>Al Faatihah</i> (Pembukaan), karena dengan surat inilah dibuka dan dimulainya Al Quran. Dinamakan <i>Ummul Quran</i> (induk Al Quran) atau <i>Ummul Kitaab</i> (induk Al Kitaab) karena dia merupakan induk dari semua isi Al Quran, dan karena itu diwajibkan membacanya pada tiap-tiap sembahyang.<br> Dinamakan pula <i>As Sab'ul matsaany</i> (tujuh yang berulang-ulang) karena ayatnya tujuh dan dibaca berulang-ulang dalam sholat.",
        nama: 'Al Fatihah',
        nomor: "1",
        rukuk: '1',
        type: 'mekah',
        urut: '5',
);