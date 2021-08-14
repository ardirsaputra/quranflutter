part of 'pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = false;
  String notif = "";
  Box box;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getToken();
      _getPublicIP();
      _toGoDashboard();
    });
  }

  Future<void> _toGoDashboard() async {
    
    Future.delayed(Duration(seconds: 3), () {
      Get.off(() => MainPage(
            page: 1,
          ));
    });
  }
Future<void> _getToken() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preference');
    if (box.get('arab') != null) {
      Preference.arab = int.parse(box.get('arab'));
      Preference.indo = int.parse(box.get('indo'));
      Preference.tartil = int.parse(box.get('tartil'));
    } else {
      box.put('arab', '1');
      box.put('indo', '1');
      box.put('tartil', '0');
      Preference.arab = int.parse(box.get('arab'));
      Preference.indo = int.parse(box.get('indo'));
      Preference.tartil = int.parse(box.get('tartil'));
    }

    print("Initialize arab : ${Preference.arab}");
    print("Initialize indo : ${Preference.indo}");
    print("Initialize tartil : ${Preference.tartil}");
  }

  void saveStatePreverenceOnMemory(String bracket, String content) async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('preference');
    box.put(bracket, content);
    print("Change State of " + bracket + " to " + content);
  }

Future<String> _getPublicIP() async {
  try {
    const url = 'https://api.ipify.org';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      Preference.ip = response.body;
      return response.body;
    } else {
      print(response.statusCode);
      print(response.body);
      Preference.ip = "Tidak Diketahui" ;
      return null;
    }
  } catch (e) {
    print(e);
    return null;
  }
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin,
                          (MediaQuery.of(context).size.height > 700) ? 100 : 0, defaultMargin, 6),
                      height: 150,
                      width: 150,
                      child: SizedBox(width: double.infinity, child: logoApp),
                    ),
                    Text('AL-Quran Digital', style: mainFontStyle3.copyWith(fontWeight: FontWeight.bold)),
                    Text('', style: mainFontStyle4),
                    SizedBox(height: (MediaQuery.of(context).size.height > 700) ? 350 : 50),
                    Text('Created by ardi with bigsource.co',
                        style: greyFontStyle4.copyWith(color: "e3e1e1".toColor())),
                    Text('Versi ${versiApp}',
                        style: greyFontStyle4.copyWith(color: "e3e1e1".toColor())),
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
