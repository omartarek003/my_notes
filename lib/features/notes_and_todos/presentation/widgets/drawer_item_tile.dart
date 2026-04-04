import 'package:flutter/material.dart';

class DrawerItemTile extends StatelessWidget {
  const DrawerItemTile({super.key, required this.title, required this.tileIsSelected, required this.icon, required this.onTap});

  final String title;
  final IconData icon;
  final bool tileIsSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
        child: ListTile(
          contentPadding: EdgeInsets.only(left: 14),
          leading: Icon(
            icon,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
          title: Text(title, style: Theme.of(context).textTheme.bodyLarge),
          selected: tileIsSelected,
          selectedTileColor:  Theme.of(context).primaryColor,
          onTap: onTap,
        ),
      ),
    );
  }
}
