import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:notes_and_todos/features/notes_and_todos/presentation/widgets/note_card.dart';
import '../../data/datasources/user_local_datasource.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../../domain/usecases/get_user_name.dart';
import '../../domain/usecases/set_user_name.dart';
import '../widgets/app_drawer.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  String userName = "";
  late GetUserName getUserName;
  late SetUserName setUserName;

  @override
  void initState() {
    super.initState();
    final repo = UserRepositoryImpl(UserLocalDataSource());
    getUserName = GetUserName(repo);
    setUserName = SetUserName(repo);
    _loadUserName();
  }

  void _loadUserName() async {
    final name = await getUserName();
    setState(() {
      userName = name;
    });
  }

  void setUserNameHandler(String newName) async {
    setState(() {
      userName = newName;
    });
    await setUserName(newName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        titleSpacing: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: Icon(LucideIcons.menu),
          ),
        ),
        title: Row(
          children: [
            Text(
              "Hi, ",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
            Text(userName, style: Theme.of(context).textTheme.bodyLarge),
          ],
        ),
      ),
      drawer: AppDrawer(onNameChanged: setUserNameHandler, userName: userName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search your note',
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
            NoteCard(),
          ],
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(
            LucideIcons.plus500,
            size: 36,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ),
    );
  }
}
