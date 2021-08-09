part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<Surat> surat = [];
  bool isOffline = false;

  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getDataSurat();
    });
  }

  Future<void> _getDataSurat() async {
    print('=========Masuk Ke GetDataSurat ================');
    final String getData = await rootBundle.loadString('assets/surat.json');
    final jsonData = await json.decode(getData);
    print(surat.length.toString());
    setState(() {
      surat = (jsonData as Iterable).map((e) => Surat.fromJson(e)).toList();
    });
    print(surat.length.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.white,
          ),
          SafeArea(
            child: ListView(
              children: [
                // Header
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                      width: double.infinity,
                      height: 60,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Al Quran Digital", style: blackFontStyle2),
                            ],
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: SizedBox(width: double.infinity, child: logoApp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Card,
               Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height - 140,
                    child: ListView(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          color: Colors.white,
                          child: Column(
                            children: [
                              // Container(
                              //     padding: EdgeInsets.only(top: 10),
                              //     child: Text("Surat", style: blackFontStyle3)),
                              SizedBox(
                                height: 16,
                              ),
                              Builder(builder: (_) {
                                List<Widget> listWidget = [];
                                if (surat.length > 0) {
                                  listWidget = surat.map((e) => CardSurat(e)).toList();
                                } else {
                                  listWidget = [
                                   SizedBox()
                                  ];
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
              ],
            ),
          ),
        ],
      ),
    );
  }
}
