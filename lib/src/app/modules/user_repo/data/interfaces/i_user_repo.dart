import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';

abstract class IUserRepo {
  Future<List<UserRepoModel>> fetchUserRepo(String username);
}
