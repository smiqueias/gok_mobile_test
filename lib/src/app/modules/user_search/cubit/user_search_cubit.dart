import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_state.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/interfaces/i_user_search.dart';
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
      emit(const UserSearchLoading());
      final userFound = await _userSearchRepository.fetchUser(username);
      emit(UserSearchLoaded(userFound));
    } on SocketException catch (e) {
      emit(const UserSearchError("Sem internet. Tente novamente mais tarde."));
      _log.e("Error in UserSearchCubit: $e");
    } on DioError catch (e) {
      emit(const UserSearchError("Erro ao pesquisar o usuário"));
      _log.e("Error in UserSearchCubit: $e");
    }
  }
}
