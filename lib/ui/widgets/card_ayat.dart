part of 'widgets.dart';

class CardAyat extends StatefulWidget {
  final Ayat ayat;
  CardAyat(this.ayat);
  @override
  _CardAyatState createState() => _CardAyatState();
}

class _CardAyatState extends State<CardAyat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.white, border: Border.all(color: mainColor)),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: mainColor,
        onTap: () {},
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Container(
                height: 30,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: mainColor,
                ),
                child: Column(children: [
                  Text(widget.ayat.nomor.toString(), style: blackFontStyle2),
                ]),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin,10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Preference.arab == 1 ? Text(widget.ayat.ar, style: blackFontStyle1,textAlign: TextAlign.right):SizedBox(),
                      Preference.tartil == 1 ? Text(removeAllHtmlTags(widget.ayat.tr), style: blackFontStyle3):SizedBox(),
                      Preference.indo == 1 ? Text("Artinya :", style: greyFontStyle3): SizedBox(),
                      Preference.indo == 1 ? Text(widget.ayat.id, style: blackFontStyle3):SizedBox(),
                    ]),
              ) 
            ],
          ),
        ),
      ),
    );
  }
}
