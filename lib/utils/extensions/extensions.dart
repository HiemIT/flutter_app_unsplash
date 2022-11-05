import 'package:flutter/material.dart';
import 'package:flutter_app_unsplash/utils/constants/enum.dart';
import 'package:unsplash_app/unsplash_app.dart';

import '../locale/app_localizations.dart';

extension ColorX on String {
  Color get converterColor => Color(int.parse(replaceAll("#", "0xff")));
}

extension AppContext on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  double countHeightPhoto(
      {required int height, required int width, required crossAxisCount}) {
    return (height / width) * (screenSize.width / crossAxisCount);
  }

  String lang(String key) => AppLocalizations.of(this).translate(key);
}

extension PhotoUrl on Urls {
  String photoUrl(LoadQualityType type) {
    switch (type) {
      case LoadQualityType.full:
        return full;
      case LoadQualityType.raw:
        return raw;
      case LoadQualityType.regular:
        return regular;
      case LoadQualityType.small:
        return small;
      case LoadQualityType.thumb:
        return thumb;
      default:
        break;
    }
    return regular;
  }
}
