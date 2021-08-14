part of 'pages.dart';

class PreferenceMenuPage extends StatefulWidget {
  @override
  _PreferenceMenuPageState createState() => _PreferenceMenuPageState();
}

class _PreferenceMenuPageState extends State<PreferenceMenuPage> {
  bool isLoading = false;
  String notif = "";
  int arab = 0;
  int indo = 0;
  int tartil = 0;
  String ipAddr = "";
  bool arabState = false;
  bool indoState = false;
  bool tartilState = false;
  Box box;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getState();
    });
  }

  Future<void> _getState() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preference');
    Preference.arab = int.parse(box.get('arab'));
    Preference.indo = int.parse(box.get('indo'));
    Preference.tartil = int.parse(box.get('tartil'));
    Preference.ip = box.get('ip');

    setState(() {
      arab = Preference.arab;
      if (arab == 1) {
        arabState = true;
      } else {
        arabState = false;
      }
      indo = Preference.indo;
      if (indo == 1) {
        indoState = true;
      } else {
        indoState = false;
      }
      tartil = Preference.tartil;
      if (tartil == 1) {
        tartilState = true;
      } else {
        tartilState = false;
      }
    });
    print("Preference arab : ${Preference.arab}");
    print("Preference indo : ${Preference.indo}");
    print("Preference tartil : ${Preference.tartil}");
    print("IP Adresss : ${Preference.ip}");
  }

  void toggleSwitchArab(bool value) async {
    setState(() {
      arabState = !arabState;
      arab == 1 ? arab = 0 : arab = 1;
    });
    Preference.arab = arab;
    saveStatePreverenceOnMemory("arab", arab.toString());
  }

  void toggleSwitchIndo(bool value) async {
    setState(() {
      indoState = !indoState;
      indo == 1 ? indo = 0 : indo = 1;
    });
    Preference.indo = indo;
    saveStatePreverenceOnMemory("indo", indo.toString());
  }

  void toggleSwitchTartil(bool value) async {
    setState(() {
      tartilState = !tartilState;
      tartil == 1 ? tartil = 0 : tartil = 1;
    });
    Preference.tartil = tartil;
    saveStatePreverenceOnMemory("tartil", tartil.toString());
  }

  void saveStatePreverenceOnMemory(String bracket, String content) async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preference');
    box.put(bracket, content);
    print("Change State of " + bracket + " to " + content);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pengaturan", style: whiteFontStyle3),
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tulisan Arab", style: blackFontStyle3),
                              Switch(
                                  onChanged: toggleSwitchArab,
                                  value: arabState,
                                  activeColor: mainColor,
                                  activeTrackColor: secondaryColor,
                                  inactiveThumbColor: redColor,
                                  inactiveTrackColor: Colors.redAccent)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tulisan Indo", style: blackFontStyle3),
                              Switch(
                                  onChanged: toggleSwitchIndo,
                                  value: indoState,
                                  activeColor: mainColor,
                                  activeTrackColor: secondaryColor,
                                  inactiveThumbColor: redColor,
                                  inactiveTrackColor: Colors.redAccent)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                      child: Card(
                        elevation: 5,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Tulisan Tartil", style: blackFontStyle3),
                              Switch(
                                  onChanged: toggleSwitchTartil,
                                  value: tartilState,
                                  activeColor: mainColor,
                                  activeTrackColor: secondaryColor,
                                  inactiveThumbColor: redColor,
                                  inactiveTrackColor: Colors.redAccent)
                            ],
                          ),
                        ),
                      ),
                    ),
                    //   Container(
                    //   margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                    //   child: Card(
                    //     elevation: 5,
                    //     child: Container(
                    //       margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                    //       height: 30,
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           Text("Alamat Internet", style: blackFontStyle3),
                    //           Text(Preference.ip??"Tidak Diketahui", style: blackFontStyle3),
                             
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                       GestureDetector(
                         onTap: (){
                           Get.to(()=>VersiPage());
                         },
                         child: Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 0),
                      child: Card(
                          elevation: 5,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(defaultMargin, 10, defaultMargin, 10),
                            height: 30,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Versi Aplikasi", style: blackFontStyle3),
                                Text(versiApp, style: blackFontStyle3),
                               
                              ],
                            ),
                          ),
                      ),
                    ),
                       ),
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
