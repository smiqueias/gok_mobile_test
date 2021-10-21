import 'package:dio/dio.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/interfaces/i_user_search.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/models/user_model.dart';
import 'package:logger/logger.dart';

class UserSearchRepository implements IUserSearch {
  final Dio _dio;
  final Logger _log;

  UserSearchRepository(this._dio, this._log);

  @override
  Future<UserModel> fetchUser(String username) async {
    try {
      final response = await _dio.get("https://api.github.com/users/$username");
      return UserModel.fromJson(response.data);
    } catch (e) {
      _log.e("Error in UserSearchRepository: $e");
      rethrow;
    }
  }
}
