import 'package:flutter/material.dart';

class ItemSetting extends StatelessWidget {
  final String title;
  String? subtitle;
  final Widget icon;
  final VoidCallback? onTap;

  ItemSetting(
      {Key? key,
      required this.title,
      this.subtitle,
      required this.icon,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).hoverColor,
      ),
      child: InkWell(
        onTap: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                flex: 2,
                child: Row(
                  children: [
                    icon,
                    const SizedBox(width: 10),
                    Text(
                      title,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  if (subtitle != null) ...[
                    Expanded(
                      child: Text(
                        subtitle!,
                        style: Theme.of(context).textTheme.bodySmall,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  const Icon(Icons.navigate_next),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
