import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingHideKeyboard extends StatelessWidget {
  final double? size;
  const LoadingHideKeyboard({Key? key, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeInOut(
        color: Colors.teal,
        size: size ?? 50.0,
      ),
    );
  }
}
