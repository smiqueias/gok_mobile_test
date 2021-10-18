import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/models/user_repo_model.dart';

part 'user_repo_state.dart';

class UserRepoCubit extends Cubit<UserRepoState> {
  UserRepoCubit() : super(UserRepoInitial());
}
