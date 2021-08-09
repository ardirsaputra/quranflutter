part of 'widgets.dart';

class CardAyat extends StatelessWidget {
  final Ayat ayat;
  CardAyat(this.ayat);
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
                margin: EdgeInsets.fromLTRB(20, 10, 20, 4),
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: mainColor,
                ),
                child: Column(children: [
                  Text(ayat.nomor.toString(), style: blackFontStyle2),
                ]),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(ayat.ar, style: blackFontStyle1,textAlign: TextAlign.right),
                      Text("Artinya :", style: greyFontStyle3),
                      Text(ayat.id, style: blackFontStyle3),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
