import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/components/user_infos_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_state.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/repositories/user_search_repository.dart';
import 'package:logger/logger.dart';

class UserDeck extends StatelessWidget {
  final String username;

  const UserDeck({Key? key, required this.username}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => UserSearchCubit(
          UserSearchRepository(Dio(), Logger()), Logger(), username),
      child: BlocBuilder<UserSearchCubit, UserSearchState>(
        builder: (context, state) {
          if (state is UserSearchInitial) {
            return const SizedBox.shrink();
          } else if (state is UserSearchLoading) {
            return Container(
              margin: EdgeInsets.only(top: 200.h),
              child: const CircularProgressIndicator(),
            );
          } else if (state is UserSearchLoaded) {
            return UserInfoComponent(
              size: size,
              state: state.userModel,
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
