import 'package:flutter/foundation.dart';

// class LogProvider cung cấp các phương thức để ghi log cho ứng dụng
class LogProvider {
  final String prefix;

  const LogProvider(this.prefix);

  void log(String content) {
    // kReleaseMode là một biến được định nghĩa trong file flutter/packages/flutter/lib/src/foundation/constants.dart
    // kReleaseMode = true khi ứng dụng được build bằng lệnh flutter build
    if (kReleaseMode) {
      return;
    }

    // ignore: avoid_print
    print('$prefix $content');
  }
}
