import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_cubit.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/cubit/user_search_state.dart';
import 'package:gok_mobile_test/src/app/modules/user_search/data/repositories/user_search_repository.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../app_colors.dart';

class UserDeckComponent extends StatelessWidget {
  final String username;

  const UserDeckComponent({Key? key, required this.username}) : super(key: key);

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
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white,
              ),
              margin: const EdgeInsets.only(top: 200),
              width: (343 / size.width) * size.width,
              height: (150 / size.height) * size.height,
              child: Container(
                margin: const EdgeInsets.only(
                  left: 24,
                  top: 24,
                  right: 16,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: CircleAvatar(
                            child: Image.network(
                              state.userModel.avatarUrl,
                              height: 64,
                              width: 64,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  state.userModel.login,
                                ),
                                IconButton(
                                  onPressed: () => {},
                                  icon: const Icon(
                                    Icons.keyboard_arrow_right_rounded,
                                    color: AppColors.black,
                                  ),
                                ),
                                const SizedBox(
                                  width: 39,
                                ),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: const BoxDecoration(
                                    color: AppColors.greyBackground,
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.delete,
                                    size: 18,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Visibility(
                                  visible:
                                      state.userModel.twitterUsername != null,
                                  child: const Text("@"),
                                ),
                                Text(state.userModel.twitterUsername ??
                                    "Não informado"),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 23,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Icon(
                          Icons.business,
                          size: 16,
                          color: AppColors.borderColor,
                        ),
                        Text(
                          state.userModel.company ?? "Não informado",
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.place,
                          size: 16,
                          color: AppColors.borderColor,
                        ),
                        Text(
                          state.userModel.location ?? "Não informado",
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                        const Icon(
                          Icons.star,
                          size: 16,
                          color: AppColors.borderColor,
                        ),
                        Text(
                          state.userModel.followers.toString(),
                          style: GoogleFonts.mulish(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: AppColors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
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
