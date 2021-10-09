
import 'package:gok_mobile_test/src/app/modules/user_search/data/models/user_model.dart';

abstract class IUserSearch {
  Future<UserModel> fetchUser(String username);
}