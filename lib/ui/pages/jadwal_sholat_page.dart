part of 'pages.dart';

class JadwalSholatPage extends StatefulWidget {
  @override
  _JadwalSholatPageState createState() => _JadwalSholatPageState();
}

class _JadwalSholatPageState extends State<JadwalSholatPage> {
  String _ip = 'Unknown';
  int detik = 0;
  String jam = 0.toString();
  String menit = 0.toString();
  String tanggal = DateTime.now().toString();
  JadwalSholat jadwalSholat = JadwalSholat(
    tanggal: DateTime.now().toString(),
    hijri: "",
    imsak: "0:0",
    subuh: "0:0",
    dhuhr: "0:0",
    asr: "0:0",
    maghrib: "0:0",
    isha: "0:0",
    lokasi: "",
  );
  int imsak = 0;
  int subuh = 0;
  int dhuhr = 0;
  int asr = 0;
  int maghrib = 0;
  int isha = 0;
  Box box;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.mounted) {
      setState(() {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _getDataLocation();
        });
      });
    }
    getSecond();
  }

  void saveStateJadwalOnMemory(String bracket, String content) async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('jadwal');
    box.put(bracket, content);
    print("Change State of " + bracket + " to " + content);
  }

  Future<void> _getDataLocation({http.Client client}) async {
    Location location = new Location();
    bool _serviceEnabled;
    LocationData _locationData;
    await Permission.location.request();
    var locationStatus = await Permission.location.status;
    if (locationStatus.isGranted) {
      _locationData = await location.getLocation();
      https: //api.pray.zone/v2/times/day.json?longitude=39.81666564941406&latitude=21.416667938232425&elevation=333&date=2021-08-14
      client ??= http.Client();
      var now = DateTime.now();
      String url =
          "https://api.pray.zone/v2/times/day.json?longitude=${_locationData.longitude}&latitude=${_locationData.latitude}&elevation=333&date=${now.year}-${now.month + 1}-${now.day}";
      var response = await client.get(url);
      print(url);
      if (response.statusCode != 200) {
        toastFail("Gagal Mengambil data", "Pastikan anda tersambung internet");
        var dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
        box = await Hive.openBox('jadwal');
        setState(() {
          jadwalSholat = JadwalSholat(
            tanggal: box.get('tanggal'),
            hijri: box.get('hijri'),
            imsak: box.get('imsak'),
            subuh: box.get('subuh'),
            dhuhr: box.get('dhuhr'),
            asr: box.get('asr'),
            maghrib: box.get('maghrib'),
            isha: box.get('isha'),
            lokasi: box.get('lokasi'),
          );
        });
      } else {
        var jsonData = jsonDecode(response.body);
        print('[Jadwal ' + jadwalUrl + ']============================');
        print(jsonData);
        print('============================');
        setState(() {
          jadwalSholat = JadwalSholat.fromJson(jsonData);
        });
        saveStateJadwalOnMemory("tanggal", jadwalSholat.tanggal);
        saveStateJadwalOnMemory("hijri", jadwalSholat.hijri);
        saveStateJadwalOnMemory("imsak", jadwalSholat.imsak);
        saveStateJadwalOnMemory("subuh", jadwalSholat.subuh);
        saveStateJadwalOnMemory("dhuhr", jadwalSholat.dhuhr);
        saveStateJadwalOnMemory("asr", jadwalSholat.asr);
        saveStateJadwalOnMemory("maghrib", jadwalSholat.maghrib);
        saveStateJadwalOnMemory("isha", jadwalSholat.isha);
        saveStateJadwalOnMemory("lokasi", jadwalSholat.lokasi ?? "lokasi anda saat ini");
      }
    } else {
      _getDataLocation();
    }
  }

  void getSecond() {
    var sekarang = DateTime.now();

    setState(() {
      jam = sekarang.hour.toString();
      menit = sekarang.minute.toString();

      detik = (int.parse(jam) * 3600) + (int.parse(menit) * 60);
      imsak = int.parse(jadwalSholat.imsak.split(":")[0]) * 3600 +
          int.parse(jadwalSholat.imsak.split(":")[1]) * 60;
      subuh = int.parse(jadwalSholat.subuh.split(":")[0]) * 3600 +
          int.parse(jadwalSholat.subuh.split(":")[1]) * 60;
      dhuhr = int.parse(jadwalSholat.dhuhr.split(":")[0]) * 3600 +
          int.parse(jadwalSholat.dhuhr.split(":")[1]) * 60;
      asr = int.parse(jadwalSholat.asr.split(":")[0]) * 3600 + int.parse(jadwalSholat.asr.split(":")[1]) * 60;
      maghrib = int.parse(jadwalSholat.maghrib.split(":")[0]) * 3600 +
          int.parse(jadwalSholat.maghrib.split(":")[1]) * 60;
      isha =
          int.parse(jadwalSholat.isha.split(":")[0]) * 3600 + int.parse(jadwalSholat.isha.split(":")[1]) * 60;
    });
    print("Detik = ${detik}");
    print("Imsak = ${imsak}");
    print("Subuh = ${subuh}");
    print("Dhuhr = ${dhuhr}");
    print("Asr = ${asr}");
    print("Maghrib = ${maghrib}");
    print("Isha = ${isha}");
    Future.delayed(Duration(minutes: 1), () {
      getSecond();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: ListView(
              children: [
                jadwalSholat.imsak != "0:0"
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(defaultMargin,
                                (MediaQuery.of(context).size.height > 700) ? 20 : 0, defaultMargin, 6),
                            height: 150,
                            width: 150,
                            child: SizedBox(width: double.infinity, child: logoApp),
                          ),
                          Text('Lokasi ${jadwalSholat.lokasi ?? "anda saat ini"}', style: mainFontStyle4),
                          Text('${jadwalSholat.tanggal.substring(0, 10)}', style: mainFontStyle4),
                          Text('${jadwalSholat.hijri}', style: mainFontStyle4),
                          detik < imsak
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Imsak", style: mainFontStyle3),
                                        Text(jadwalSholat.imsak, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Imsak", style: blackFontStyle3),
                                        Text(jadwalSholat.imsak, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          detik > imsak && detik < subuh
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subuh", style: mainFontStyle3),
                                        Text(jadwalSholat.subuh, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Subuh", style: blackFontStyle3),
                                        Text(jadwalSholat.subuh, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          detik > subuh && detik < dhuhr
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Dhuhr", style: mainFontStyle3),
                                        Text(jadwalSholat.dhuhr, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Dhuhr", style: blackFontStyle3),
                                        Text(jadwalSholat.dhuhr, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          detik > dhuhr && detik < asr
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Asr", style: mainFontStyle3),
                                        Text(jadwalSholat.asr, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Asr", style: blackFontStyle3),
                                        Text(jadwalSholat.asr, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          detik > asr && detik < maghrib
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Maghrib", style: mainFontStyle3),
                                        Text(jadwalSholat.maghrib, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Maghrib", style: blackFontStyle3),
                                        Text(jadwalSholat.maghrib, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          detik > maghrib && detik < isha
                              ? Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Isha", style: mainFontStyle3),
                                        Text(jadwalSholat.isha, style: mainFontStyle3),
                                      ],
                                    ),
                                  ),
                                )
                              : Container(
                                  margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(color: mainColor, style: BorderStyle.solid)),
                                  child: Container(
                                    margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                                    height: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Isha", style: blackFontStyle3),
                                        Text(jadwalSholat.isha, style: blackFontStyle3),
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(height: 100),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(defaultMargin,
                                  (MediaQuery.of(context).size.height > 700) ? 20 : 0, defaultMargin, 6),
                              height: 150,
                              width: 150,
                              child: SizedBox(width: double.infinity, child: logoApp),
                            ),
                            Text("Konten ini membutuhkan data internet ", style: mainFontStyle3),
                            Text("pastikan anda terhubung dengan internet ", style: mainFontStyle3),
                          ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
