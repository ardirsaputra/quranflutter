part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int page;
  final int riwayatPage;
  const MainPage({Key key, this.page, this.riwayatPage = 1}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedPage = 0;
  int riwayatPage = 0;
  bool isLoading = false;
  PageController pageController = PageController(initialPage: 0);
  void initState() {
    super.initState();
    if (widget.page != null) {
      if (widget.riwayatPage != null) {
        setState(() {
          riwayatPage = widget.riwayatPage;
        });
      }
      setState(() {
        pageController = PageController(initialPage: widget.page);
        selectedPage = widget.page;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBackToCloseApp(
        snackBar: const SnackBar(
            content: Text('Ketuk lagi untuk keluar'),
          ),
        child: Stack(
          children: [
            Container(),
            SafeArea(
                child: Container(
              color: 'FAFAFC'.toColor(),
            )),
            isLoading
                ? loadingIndicator
                : SafeArea(
                    child: PageView(
                      controller: pageController,
                      onPageChanged: (index) async {
                        setState(() {
                          selectedPage = index;
                        });
                      },
                      children: [
                        ComingSoonPage(nama:"Fitur Favorit"),
                        DashboardPage(),
                        ComingSoonPage(nama:"Fitur Jadwal Sholat"),
                      ],
                    ),
                  ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomNavbar(
                selectedIndex: selectedPage,
                onTap: (index) {
                  setState(() {
                    selectedPage = index;
                  });
                  pageController.jumpToPage(selectedPage);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
