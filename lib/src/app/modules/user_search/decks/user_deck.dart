import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_infos_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_state.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/repositories/user_search_repository.dart';

class UserDeck extends StatelessWidget {
  final String username;

  const UserDeck({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => UserSearchCubit(
          UserSearchRepository(Modular.get(), Modular.get()),
          Modular.get(),
          username),
      child: BlocBuilder<UserSearchCubit, UserSearchState>(
        builder: (context, state) {
          if (state is UserSearchInitial) {
            return const SizedBox.shrink();
          } else if (state is UserSearchLoading) {
            return Container(
              margin: const EdgeInsets.only(top: 200),
              child: const CircularProgressIndicator(),
            );
          } else if (state is UserSearchLoaded) {
            return UserInfoComponent(
              size: size,
              state: state,
              username: username,
            );
          } else if (state is UserSearchError) {
            return Container(
              margin: const EdgeInsets.only(top: 200),
              child: Text(
                state.errorMessage,
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
