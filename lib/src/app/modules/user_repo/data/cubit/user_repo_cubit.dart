import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/interfaces/i_user_repo.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';
import 'package:logger/logger.dart';

part 'user_repo_state.dart';

class UserRepoCubit extends Cubit<UserRepoState> {
  final IUserRepo _userRepoRepository;
  final Logger _log;
  final String username;

  UserRepoCubit(
    this._userRepoRepository,
    this._log,
    this.username,
  ) : super(UserRepoInitial()) {
    fetchUserRepo(username);
  }

  Future<void> fetchUserRepo(String username) async {
    try {
      emit(UserRepoLoading());
      final userRepo = await _userRepoRepository.fetchUserRepo(username);
      emit(UserRepoLoaded(userRepo));
    } on SocketException catch (e) {
      emit(const UserRepoError("Sem internet. Tente novamente mais tarde."));
      _log.e("Error in UserRepoCubit: $e");
    } catch (e) {
      emit(const UserRepoError("Erro ao pesquisar o usuário"));
      _log.e("Error in UserRepoCubit: $e");
    }
  }
}
