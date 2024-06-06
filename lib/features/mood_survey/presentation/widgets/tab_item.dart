import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  final String title;
  final Widget? icon;

  const TabItem({
    super.key,
    required this.title,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.maxFinite,
      child: Row(
        children: [
          if (icon != null) SizedBox(height: 12,child: icon!),
          const SizedBox(width: 6),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
