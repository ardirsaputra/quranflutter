part of 'pages.dart';

class VersiPage extends StatefulWidget {
  @override
  final String nama;
  const VersiPage({Key key, this.nama}) : super(key: key);
  _VersiPageState createState() => _VersiPageState();
}

class _VersiPageState extends State<VersiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Versi Aplikasi", style: whiteFontStyle3),
        backgroundColor: mainColor,
      ),
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                        SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('Versi 1.1.0',style:blackFontStyle3.copyWith(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('- Surat alquran lengkap offline tanpa perlu koneksi internet')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('- Penambahan fitur mode baca surat')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('- Penambahan fitur jadwal sholat yang diambil langsung dari gps pengguna sebagai lokasinya')),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('- Penambahan halaman versi')),
                    SizedBox(height: 10,),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('Versi 1.0.0',style:blackFontStyle3.copyWith(fontWeight: FontWeight.bold))),
                    Padding(padding: EdgeInsets.symmetric(horizontal: defaultMargin),child:Text('- Surat alquran Lengkap yang di ambil diinternet')),
                    SizedBox(height: 50),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
