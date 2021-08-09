part of 'shared.dart';

 String convertDateTime(DateTime dateTime) {
    String month;

    switch (dateTime.month) {
      case 1:
        month = 'Jan';
        break;
      case 2:
        month = 'Feb';
        break;
      case 3:
        month = 'Mar';
        break;
      case 4:
        month = 'Apr';
        break;
      case 5:
        month = 'Mei';
        break;
      case 6:
        month = 'Jun';
        break;
      case 7:
        month = 'Jul';
        break;
      case 8:
        month = 'Aug';
        break;
      case 9:
        month = 'Sep';
        break;
      case 10:
        month = 'Okt';
        break;
      case 11:
        month = 'Nov';
        break;
      default:
        month = 'Des';
    }

    return '${dateTime.day} ${month} ${dateTime.year.toString()} , ${dateTime.hour}:${dateTime.minute}';
  }

  void toastSuccess(String titleMessage, String msg) {
    Get.snackbar("", "",
        backgroundColor: mainColor,
        icon: Icon(Icons.check, color: Colors.white),
        titleText:
            Text(titleMessage, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
        messageText: Text(msg, style: GoogleFonts.poppins(color: Colors.white)));
  }

  void toastFail(String titleMessage, String msg) {
    Get.snackbar("", "",
        backgroundColor: redColor,
        icon: Icon(Icons.clear, color: Colors.white),
        titleText:
            Text(titleMessage, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w600)),
        messageText: Text(msg, style: GoogleFonts.poppins(color: Colors.white)));
  }

    void toastWarning(String titleMessage, String msg) {
    Get.snackbar("", "",
        backgroundColor: Colors.amber,
        icon: Icon(Icons.info, color: Colors.black),
        titleText:
            Text(titleMessage, style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600)),
        messageText: Text(msg, style: GoogleFonts.poppins(color: Colors.black)));
  }

 Future<bool> internetError() async {
    try {
      final result = await Io.InternetAddress.lookup(suratUrl.split("/")[2]);
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print("[Check Internet]================");
        print("Response Body : " + result.toString());
        print('Connected');
        return false;
      }
      print('Not connected');
      return true;
    } on Io.SocketException catch (_) {
      print('Not connected');
      return true;
    }
 }
