part of 'models.dart';

class Ayat extends Equatable{
  final String ar;
  final String id;
  final String nomor;
  final String tr;
 
  Ayat({
    this.ar,
    this.id,
    this.nomor,
    this.tr,
  });
   Ayat copywith({
   String ar,
   String id,
   String nomor,
   String tr,
  }){
      return Ayat(
        ar:  ar ?? this.ar,
        id:  id ?? this.id,
        nomor:  nomor ?? this.nomor,
        tr:  tr ?? this.tr,
      );
    }

  @override
  // TODO: implement props
  List<Object> get props => [
    ar,id,nomor,tr
  ];
   factory Ayat.fromJson(Map<String, dynamic> data) {
    return Ayat(
        ar: data['ar'],
        id: data['id'],
        nomor: data['nomor'],
        tr: data['tr'],
    );
  }
}
