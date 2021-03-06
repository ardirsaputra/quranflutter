part of 'pages.dart';

class SuratPage extends StatefulWidget {
  final Surat surat;
  const SuratPage({Key key, this.surat}) : super(key: key);
  @override
  _SuratPageState createState() => _SuratPageState();
}

class _SuratPageState extends State<SuratPage> {
  List<Ayat> ayat = [];
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDataAyat();
    });
  }

  // Future<void> _getAyats({http.Client client}) async {
  //   client ??= http.Client();
  //   var response = await client.get(ayatUrl + widget.surat.nomor);
  //   if (response.statusCode != 200) {
  //     toastFail("Gagal Mengambil data", "Pastikan anda tersambung internet");
  //   }
  //   var jsonData = jsonDecode(response.body);
  //   print('[Ayat Index ' + ayatUrl + widget.surat.nomor + ']============================');
  //   print(jsonData);
  //   print('============================');

  //   print(ayat.length.toString());
  //   setState(() {
  //     ayat = (jsonData as Iterable).map((e) => Ayat.fromJson(e)).toList();
  //   });
  //   print(ayat.length.toString());
  // }

    Future<void> _getDataAyat() async {
    print('=========Masuk Ke Get Data Surat ke [${widget.surat.nomor}]================');
    final String getData = await rootBundle.loadString('assets/ayat.json');
    final jsonData = await json.decode(getData)[int.parse(widget.surat.nomor) -1];
    setState(() {
      ayat = (jsonData as Iterable).map((e) => Ayat.fromJson(e)).toList();
    });
  }

  Future<void> _refresh() async {
    await _getDataAyat();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          widget.surat.nomor +
              ". " +
              widget.surat.nama +
              " (" +
              widget.surat.asma +
              ")"+
              " (" +
              widget.surat.ayat.toString() +
              " ayat)",
          style: whiteFontStyle3.copyWith(fontWeight: FontWeight.bold),
        ),
        // actions: <Widget>[
        //   Padding(
        //       padding: EdgeInsets.only(right: 20.0),
        //       child: GestureDetector(
        //         onTap: () {
        //           Get.to(()=>PreferenceMenuPage());
        //         },
        //         child: Icon(Icons.more_vert),
        //       )),
        // ],
      ),
      body: RefreshIndicator(
        color: mainColor,
        onRefresh: _refresh,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: MediaQuery.of(context).size.height - 80,
          child: ListView(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  children: [
                    Container(
                      child: Text('Surat ' + widget.surat.nama, style: blackFontStyle2),
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          removeAllHtmlTags(widget.surat.keterangan),
                          style: blackFontStyle3,
                          textAlign: TextAlign.center,
                        )),
                    SizedBox(
                      height: 16,
                    ),
                    Builder(builder: (_) {
                      List<Widget> listWidget = [];
                      if (ayat.length > 0) {
                        listWidget = ayat.map((e) => CardAyat(e)).toList();
                      } else {
                        listWidget = [SizedBox()];
                      }
                      return Column(
                        children: listWidget.map((e) => e).toList(),
                      );
                    }),
                    SizedBox()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
