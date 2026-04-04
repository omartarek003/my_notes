
import '../repositories/user_repository.dart';

class GetUserName {
  final UserRepository repo;

  GetUserName(this.repo);

  Future<String> call() async {
    return await repo.getUserName();
  }
}