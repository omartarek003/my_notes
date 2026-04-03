import 'package:notes_and_todos/features/todo/data/datasources/user_local_datasource.dart';
import 'package:notes_and_todos/features/todo/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<String> getUserName() {
    return localDataSource.getUserName();
  }

  @override
  Future<void> setUserName(String name) {
    return localDataSource.setUserName(name);
  }
}
