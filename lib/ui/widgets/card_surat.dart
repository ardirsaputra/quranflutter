part of 'widgets.dart';

class CardSurat extends StatelessWidget {
  final Surat surat;

  CardSurat(this.surat);
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
        onTap: () {
          Get.to(() => SuratPage(surat: surat));
        },
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
                  Text(surat.nomor.toString(), style: blackFontStyle2),
                ]),
              ),
              Container(
                height: 70,
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(surat.nama, style: blackFontStyle2),
                          Text(" ( " + surat.asma + " ) ", style: blackFontStyle2),
                        ],
                      ),
                      Text(surat.arti, style: greyFontStyle3),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
