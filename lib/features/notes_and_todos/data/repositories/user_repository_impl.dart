import '../../domain/repositories/user_repository.dart';
import '../datasources/user_local_datasource.dart';

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
