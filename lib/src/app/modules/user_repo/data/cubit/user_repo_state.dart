part of 'user_repo_cubit.dart';

abstract class UserRepoState extends Equatable {
  const UserRepoState();

  @override
  List<Object> get props => [];
}

class UserRepoInitial extends UserRepoState {
  @override
  List<Object> get props => [];
}

class UserRepoLoading extends UserRepoState {
  @override
  List<Object> get props => [];
}

class UserRepoLoaded extends UserRepoState {
  final List<UserRepoModel> userRepoModel;

  const UserRepoLoaded(this.userRepoModel);

  @override
  List<Object> get props => [userRepoModel];
}

class UserRepoError extends UserRepoState {
  final String errorMessage;

  const UserRepoError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
