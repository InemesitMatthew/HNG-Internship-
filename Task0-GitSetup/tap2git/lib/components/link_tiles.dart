import 'package:flutter/material.dart';

class LinkTiles extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const LinkTiles({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }
}
