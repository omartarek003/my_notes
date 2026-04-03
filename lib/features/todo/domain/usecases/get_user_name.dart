import 'package:notes_and_todos/features/todo/domain/repositories/user_repository.dart';

class GetUserName {
  final UserRepository repo;

  GetUserName(this.repo);

  Future<String> call() async {
    return await repo.getUserName();
  }
}