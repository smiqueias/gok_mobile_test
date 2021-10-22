import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_state.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/interfaces/i_user_search.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  final IUserSearch _userSearchRepository;
  final Logger _log;
  final String username;

  UserSearchCubit(this._userSearchRepository, this._log, this.username)
      : super(const UserSearchInitial()) {
    fetchUser(username);
  }

  Future<void> fetchUser(String username) async {
    try {
      bool hasInternet = await InternetConnectionChecker().hasConnection;
      if (hasInternet) {
        emit(const UserSearchLoading());
        final userFound = await _userSearchRepository.fetchUser(username);
        emit(UserSearchLoaded(userFound));
      } else {
        emit(const UserSearchError("Verifique sua conexão e tente novamente!"));
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 404) {
        emit(const UserSearchError("Usuário não encontrado"));
      } else {
        emit(const UserSearchError("Erro ao pesquisar o usuário"));
        _log.e("Error in UserSearchCubit: $e");
      }
    }
  }
}
