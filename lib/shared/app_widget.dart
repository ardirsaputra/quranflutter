part of 'shared.dart';

Widget loadingIndicator = SpinKitFadingCircle(size: 45, color: mainColor);
Widget logoApp = Hero(
  tag: "icon_app",
  child: Material(
    color: Colors.transparent,
    child: InkWell(
      splashColor: secondaryColor,
      borderRadius: BorderRadius.circular(40.0),
      onTap: () {
        
      },
      child: Image.asset(
        'assets/icon-app-af.png',
        fit: BoxFit.contain,
      ),
    ),
  ),
);
