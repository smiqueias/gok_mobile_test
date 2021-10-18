import 'package:dio/dio.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/interfaces/i_user_repo.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:logger/logger.dart';

class UserRepoRepository implements IUserRepo {
  final Dio _dio;
  final Logger _log;

  UserRepoRepository(this._dio, this._log);

  @override
  Future<List<UserRepoModel>> fetchUserRepo(String username) async {
    try {
      final response = await _dio.get<List>(
        "https://api.github.com/users/$username/repos",
      );

      return response.data!.map((e) => UserRepoModel.fromJson(e)).toList();
    } catch (e) {
      _log.e("Error in UserRepoRepository: $e");
      rethrow;
    }
  }
}
