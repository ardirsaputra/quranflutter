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
      _toGoDashboard();
    });
  }

  Future<void> _toGoDashboard() async {

      Future.delayed(Duration(seconds: 5), (){
        Get.off(() => MainPage(page: 1,));
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(defaultMargin, (MediaQuery.of(context).size.height > 700 ) ? 100 : 0, defaultMargin, 6),
                      height: 150,
                      width: 150,
                      child: SizedBox(width: double.infinity, child:logoApp),
                    ),
                    Text('AL-Quran Digital', style: mainFontStyle3.copyWith(fontWeight: FontWeight.bold)),
                    Text('', style: mainFontStyle4),
                    SizedBox(height:(MediaQuery.of(context).size.height > 700 ) ? 400 : 50),
                    Text('Created by ardi with bigsource.co', style: greyFontStyle4.copyWith(color: "e3e1e1".toColor())),
                    SizedBox(height:50),
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
