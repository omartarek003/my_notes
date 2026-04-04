import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:notes_and_todos/features/notes_and_todos/presentation/widgets/theme_toggle.dart';
import '../enums/drawer_item_enum.dart';
import 'drawer_item_tile.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key, required this.onNameChanged, required this.userName});

  final String userName;
  final void Function(String) onNameChanged;

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  DrawerItem _selected = DrawerItem.notes;
  late TextEditingController userNameController;

  @override
  void initState() {
    super.initState();
    userNameController = TextEditingController(text: widget.userName);
  }

  void _submitUserName() {
    widget.onNameChanged(userNameController.text);
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, bottom: 28),
              child: Text(
                "My Notes",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
            DrawerItemTile(
              title: "Notes",
              icon: LucideIcons.notebookPen500,
              tileIsSelected: _selected == DrawerItem.notes,
              onTap: () {
                setState(() {
                  _selected = DrawerItem.notes;
                });
                Navigator.pop(context);
              },
            ),
            DrawerItemTile(
              title: "Create new label",
              icon: LucideIcons.tag500,
              tileIsSelected: _selected == DrawerItem.createNewLabel,
              onTap: () {
                setState(() {
                  _selected = DrawerItem.createNewLabel;
                });
                Navigator.pop(context);
              },
            ),
            DrawerItemTile(
              title: "Trash",
              icon: LucideIcons.trash2,
              tileIsSelected: _selected == DrawerItem.trash,
              onTap: () {
                setState(() {
                  _selected = DrawerItem.trash;
                });
                Navigator.pop(context);
              },
            ),
            ThemeToggle(),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: MediaQuery.of(context).viewInsets.bottom + 16,
              ),
              child: TextField(
                controller: userNameController,
                onChanged: (value) => _submitUserName(),
                maxLength: 25,
                decoration: InputDecoration(
                  hintText: 'Your name',
                  counterText: '',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  hintStyle: TextStyle(
                    color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.5),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).cardColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
