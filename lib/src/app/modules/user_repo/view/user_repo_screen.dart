import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_empty_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_input_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/decks/user_repo_deck.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

class UserRepoScreen extends StatefulWidget {
  final UserDTO userDTO;
  const UserRepoScreen({Key? key, required this.userDTO}) : super(key: key);

  @override
  State<UserRepoScreen> createState() => _UserRepoScreenState();
}

class _UserRepoScreenState extends State<UserRepoScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    List<String> tags = [
      "#TagTeste01",
      "#TagTeste02",
      "#TagTeste03",
      "#TagTeste04",
      "#TagTeste05",
    ];

    return BlocProvider(
      create: (context) => UserRepoCubit(
        Modular.get(),
        Modular.get(),
        widget.userDTO.username,
      ),
      child: Scaffold(
        appBar: AppBarComponent(
          size: size,
          userDTO: widget.userDTO,
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
                        userDTO: widget.userDTO,
                        searchController: _searchController,
                        size: size,
                        state: state,
                        userRepoCubit: context.read<UserRepoCubit>(),
                        label:
                            "${widget.userDTO.username} não possui repositorios criados ou públicos.",
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
                            height: (8 / size.height) * size.height,
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
                        userDTO: widget.userDTO,
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
                            height: (8 / size.height) * size.height,
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
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
