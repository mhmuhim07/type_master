import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-8678053228194446/3004639143";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
