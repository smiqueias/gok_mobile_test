import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_empty_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/cubit/user_repo_cubit.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';

class UserRepoScreen extends StatelessWidget {
  final UserDTO userDTO;
  const UserRepoScreen({Key? key, required this.userDTO}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => UserRepoCubit(
        Modular.get(),
        Modular.get(),
        userDTO.username,
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: AppColors.white,
          toolbarHeight: (72 / size.height) * size.height,
          leading: IconButton(
            onPressed: () => Modular.to.pop(context),
            icon: const Icon(
              Icons.arrow_back,
              size: 32,
            ),
          ),
          actions: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      userDTO.avatarUrl.toString(),
                      height: 32,
                      width: 32,
                    ),
                  ),
                ),
              ],
            ),
          ],
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
                    ? RepoEmptyLabelComponent(userDTO: userDTO)
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: state.userRepoModel.length,
                        itemBuilder: (context, index) {
                          return Text(
                            state.userRepoModel[index].name!,
                          );
                        },
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
