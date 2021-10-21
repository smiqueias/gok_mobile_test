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
  List<UserRepoModel>? userRepoModel;

  UserRepoCubit(
    this._userRepoRepository,
    this._log,
    this.username,
  ) : super(const UserRepoInitial()) {
    fetchUserRepo(username);
  }

  Future<void> fetchUserRepo(String username) async {
    try {
      emit(const UserRepoLoading());
      final userRepo = await _userRepoRepository.fetchUserRepo(username);
      userRepoModel = userRepo;
      emit(UserRepoLoaded(userRepo));
    } on SocketException catch (e) {
      emit(const UserRepoError("Sem internet. Tente novamente mais tarde."));
      _log.e("Error in UserRepoCubit: $e");
    } catch (e) {
      emit(const UserRepoError("Erro ao pesquisar o usuário"));
      _log.e("Error in UserRepoCubit: $e");
    }
  }

  onSubmitted(String value) {
    var userRepoFiltered = userRepoModel!
        .where(
          (e) => e.toString().toLowerCase().contains(
                value.toLowerCase(),
              ),
        )
        .toList();
    emit(UserRepoFiltered(userRepoModel: userRepoFiltered));
  }

  int calculateRepoTime(String repoCreateAt) {
    final repoYear = int.parse(repoCreateAt.toString().substring(0, 4));
    final repoMonth = int.parse(repoCreateAt.toString().substring(5, 7));
    final repoDay = int.parse(repoCreateAt.toString().substring(8, 10));
    final currentDate = DateTime.now();
    final repoDate = DateTime(repoYear, repoMonth, repoDay);
    final repoTime = currentDate.difference(repoDate).inDays;
    return repoTime;
  }
}