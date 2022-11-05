import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DiaLogSetting extends StatelessWidget {
  const DiaLogSetting(
      {Key? key,
      this.themeMode,
      this.onChangeThemeMode,
      this.localeValue,
      this.onChangeLocale})
      : super(key: key);

  // theme
  final ValueNotifier<ThemeMode>? themeMode;
  final Function(ThemeMode)? onChangeThemeMode;

  // locale
  final ValueNotifier<Locale>? localeValue;
  final Function(Locale)? onChangeLocale;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Wrap(
          children: [
            const SizedBox(
              width: double.infinity,
              height: 25,
            ),
            Text(
              'Title',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              width: double.infinity,
              height: 14,
            ),

            //  ValueListenableBuilder
            ValueListenableBuilder(
              valueListenable: valueListenable,
              builder: (context, value, child) {
                return Column(
                  children: [],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// fake data valueListenable
ValueListenable valueListenable = ValueNotifier(
  'value',
);
