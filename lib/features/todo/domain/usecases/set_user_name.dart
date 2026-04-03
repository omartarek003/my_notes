import 'package:notes_and_todos/features/todo/domain/repositories/user_repository.dart';

class SetUserName {
  final UserRepository repo;

  SetUserName(this.repo);

  Future<void> call(String name) async {
    await repo.setUserName(name);
  }
}
