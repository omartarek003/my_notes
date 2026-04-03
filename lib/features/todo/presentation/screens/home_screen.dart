import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:notes_and_todos/features/todo/data/datasources/user_local_datasource.dart';
import 'package:notes_and_todos/features/todo/data/repositories/user_repository_impl.dart';
import 'package:notes_and_todos/features/todo/domain/usecases/get_user_name.dart';
import 'package:notes_and_todos/features/todo/domain/usecases/set_user_name.dart';
import '../widgets/app_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
    );
  }
}