part of 'shared.dart';

class AppConverter {
  static String toBase64(PickedFile pickedFile) {
    try {
      final bytes = Io.File(pickedFile.path).readAsBytesSync();
      String _img64Path = base64Encode(bytes);
      print('toBase64 Success');
      return _img64Path;
    } catch (e) {
      print('toBase64 Exception : ${e.toString()}');
      return e.toString();
    }
  }
}
