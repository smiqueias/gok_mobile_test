
import 'package:equatable/equatable.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/models/user_model.dart';

abstract class UserSearchState extends Equatable {
  const UserSearchState();
}

class UserSearchInitial extends UserSearchState {
  const UserSearchInitial();

  @override
  List<Object?> get props => [];
}

class UserSearchLoading extends UserSearchState {

  const UserSearchLoading();

  @override
  List<Object?> get props => [];
}

class UserSearchLoaded extends UserSearchState {

  final UserModel userModel;

  const UserSearchLoaded(this.userModel);

  @override
  List<Object?> get props => [userModel];
}

class UserSearchError extends UserSearchState {

  final String errorMessage;

  const UserSearchError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];

}
