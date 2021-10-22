import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_empty_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_input_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/repositories/user_repo_repository.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/decks/user_repo_deck.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';
import 'package:logger/logger.dart';

class UserRepoScreen extends StatefulWidget {
  static const String screenRoute = "/userRepo";
  const UserRepoScreen({Key? key}) : super(key: key);

  @override
  State<UserRepoScreen> createState() => _UserRepoScreenState();
}

class _UserRepoScreenState extends State<UserRepoScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    final userDTO = ModalRoute.of(context)!.settings.arguments as UserDTO;

    List<String> tags = [
      "#TagTeste01",
      "#TagTeste02",
      "#TagTeste03",
      "#TagTeste04",
    ];

    return BlocProvider(
      create: (context) => UserRepoCubit(
        UserRepoRepository(Dio(), Logger()),
        Logger(),
        userDTO.username,
      ),
      child: Scaffold(
        appBar: AppBarComponent(
          size: size,
          userDTO: userDTO,
        ),
        body: SafeArea(
          child: BlocBuilder<UserRepoCubit, UserRepoState>(
            builder: (context, state) {
              if (state is UserRepoLoading) {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              } else if (state is UserRepoLoaded) {
                return state.userRepoModel.isEmpty
                    ? RepoEmptyLabelComponent(
                        userDTO: userDTO,
                        searchController: _searchController,
                        size: size,
                        state: state,
                        userRepoCubit: context.read<UserRepoCubit>(),
                        label:
                            "${userDTO.username} não possui repositorios criados ou públicos.",
                      )
                    : Column(
                        children: [
                          SearchBarInputComponent(
                            searchBarInputController: _searchController,
                            size: size,
                            userRepoCubit: context.read<UserRepoCubit>(),
                            state: state,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.userRepoModel.length,
                              itemBuilder: (context, index) {
                                return UserRepoDeck(
                                  index: index,
                                  size: size,
                                  state: state,
                                  tags: tags,
                                  userRepoCubit: context.read<UserRepoCubit>(),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              } else if (state is UserRepoFiltered) {
                return state.userRepoModel.isEmpty
                    ? RepoEmptyLabelComponent(
                        userDTO: userDTO,
                        searchController: _searchController,
                        size: size,
                        state: state,
                        userRepoCubit: context.read<UserRepoCubit>(),
                        label: "Nenhum repositório encontrado.",
                      )
                    : Column(
                        children: [
                          SearchBarInputComponent(
                            searchBarInputController: _searchController,
                            size: size,
                            userRepoCubit: context.read<UserRepoCubit>(),
                            state: state,
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.userRepoModel.length,
                              itemBuilder: (context, index) {
                                return UserRepoDeck(
                                  index: index,
                                  size: size,
                                  state: state,
                                  tags: tags,
                                  userRepoCubit: context.read<UserRepoCubit>(),
                                );
                              },
                            ),
                          ),
                        ],
                      );
              } else if (state is UserRepoError) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(top: 200.h),
                    child: Text(
                      state.errorMessage,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
