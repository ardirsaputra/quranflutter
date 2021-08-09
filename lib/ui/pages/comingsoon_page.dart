part of 'pages.dart';

class ComingSoonPage extends StatefulWidget {
  @override
  final String nama;
  const ComingSoonPage({Key key, this.nama}) : super(key: key);
  _ComingSoonPageState createState() => _ComingSoonPageState();
}

class _ComingSoonPageState extends State<ComingSoonPage> {
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
                    Text(widget.nama + ' Akan Segera Ditambahkan', style: mainFontStyle3.copyWith(fontWeight: FontWeight.bold)),
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
