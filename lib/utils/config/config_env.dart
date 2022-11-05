import '../constants/enum.dart';

class ConfigEnv {
  static Flavor? appFlavor;

  static String getDomainAPI() {
    switch (appFlavor) {
      case Flavor.staging:
        return 'https://api.unsplash.com';
      case Flavor.mock:
        return 'https://api.unsplash.com';
      default:
        return 'https://api.unsplash.com';
    }
  }
}
