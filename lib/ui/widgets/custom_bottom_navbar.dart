part of 'widgets.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int selectedIndex;
  final Function(int index) onTap;
  CustomBottomNavbar({this.selectedIndex = 1, this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: mainColor),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(0);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: EdgeInsets.only(top: 3),
              color: (selectedIndex == 0) ? Colors.white : mainColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //     width: 32,
                  //     height: 32,
                  //     margin: EdgeInsets.symmetric(horizontal: 30),
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             fit: BoxFit.contain,
                  //             image: AssetImage(
                  //                 'assets/alquran' + ((selectedIndex == 0) ? '.png' : '_normal.png'))))),
                  Text(
                    'Surat Favorit',
                    style: (selectedIndex == 0) ?  mainFontStyle3 : whiteFontStyle3,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(1);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: EdgeInsets.only(top: 3),
                    color: (selectedIndex == 1) ? Colors.white : mainColor,
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //     width: 32,
                  //     height: 32,
                  //     margin: EdgeInsets.symmetric(horizontal: 30),
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             fit: BoxFit.contain,
                  //             image: AssetImage(
                  //                 'assets/sholat' + ((selectedIndex == 1) ? '.png' : '_normal.png'))))),
                  Text(
                    'Alquran',
                    style: (selectedIndex == 1) ? mainFontStyle3 : whiteFontStyle3,
                  ),
                ],
              ),
            ),
          ),
           GestureDetector(
            onTap: () {
              if (onTap != null) {
                onTap(2);
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              padding: EdgeInsets.only(top: 3),
                    color: (selectedIndex == 2) ? Colors.white : mainColor,
              child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Container(
                  //     width: 32,
                  //     height: 32,
                  //     margin: EdgeInsets.symmetric(horizontal: 30),
                  //     decoration: BoxDecoration(
                  //         image: DecorationImage(
                  //             fit: BoxFit.contain,
                  //             image: AssetImage(
                  //                 'assets/sholat' + ((selectedIndex == 1) ? '.png' : '_normal.png'))))),
                  Text(
                    'Jadwal Sholat',
                    style: (selectedIndex == 2) ? mainFontStyle3 : whiteFontStyle3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
