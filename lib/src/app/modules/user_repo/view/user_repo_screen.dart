import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gok_mobile_test/src/app/app_colors.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/appbar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/description_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_empty_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/search_bar_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/star_icon_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/tag_list_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/cubit/user_repo_cubit.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utils/extensions/string_extension.dart';
import 'package:gok_mobile_test/src/app/utils/user_dto.dart';
import 'package:google_fonts/google_fonts.dart';

class UserRepoScreen extends StatefulWidget {
  final UserDTO userDTO;
  const UserRepoScreen({Key? key, required this.userDTO}) : super(key: key);

  @override
  State<UserRepoScreen> createState() => _UserRepoScreenState();
}

class _UserRepoScreenState extends State<UserRepoScreen> {
  Future<void> _launcLink(String url) async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: false, forceSafariVC: false);
    } else {
      final snackBar =
          SnackBar(content: Text("Não foi possível acessar o repopositório"));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final TextEditingController _searchController = TextEditingController();

    List<String> tags = [
      "#TagTeste01",
      "#TagTeste02",
      "#TagTeste03",
      "#TagTeste04",
      "#TagTeste05",
    ];

    @override
    // ignore: unused_element
    void dispose() {
      _searchController.dispose();
      super.dispose();
    }

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
                    ? RepoEmptyLabelComponent(userDTO: widget.userDTO)
                    : Column(
                        children: [
                          SearchBarComponent(
                              size: size,
                              searchBarInputController: _searchController),
                          SizedBox(
                            height: (8 / size.height) * size.height,
                          ),
                          Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: state.userRepoModel.length,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: AppColors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: .08,
                                        spreadRadius: 0.0,
                                        offset: const Offset(
                                          0.0,
                                          1.0,
                                        ),
                                      )
                                    ],
                                  ),
                                  height: (190 / size.height) * size.height,
                                  width: (343 / size.width) * size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  left: 16,
                                                  top: 26,
                                                ),
                                                child: Text(
                                                  state.userRepoModel[index]
                                                      .name!
                                                      .intelliTrim(23),
                                                  style: GoogleFonts.mulish(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: (8 / size.width) *
                                                    size.width,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  top: 24,
                                                ),
                                                child: IconButton(
                                                  onPressed: () => _launcLink(
                                                    state.userRepoModel[index]
                                                        .htmlUrl,
                                                  ),
                                                  icon: const Icon(
                                                    Icons.keyboard_arrow_right,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          StarIconComponent(
                                            index: index,
                                            size: size,
                                            state: state,
                                          ),
                                        ],
                                      ),
                                      DescriptionLabelComponent(
                                        size: size,
                                        description: state
                                            .userRepoModel[index].description!
                                            .intelliTrim(40),
                                      ),
                                      TagListComponent(
                                        tags: tags,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                          top: 16.0,
                                          left: 16.0,
                                          bottom: 8.0,
                                        ),
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.language,
                                                  size: 16,
                                                  color: AppColors.borderColor,
                                                ),
                                                Text(
                                                  state.userRepoModel[index]
                                                      .language!,
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: (16 / size.width) *
                                                  size.width,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.star,
                                                  size: 16,
                                                  color: AppColors.borderColor,
                                                ),
                                                Text(
                                                  state.userRepoModel[index]
                                                      .stargazersCount
                                                      .toString(),
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: (16 / size.width) *
                                                  size.width,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.supervisor_account,
                                                  size: 16,
                                                  color: AppColors.borderColor,
                                                ),
                                                Text(
                                                  state.userRepoModel[index]
                                                      .watchersCount
                                                      .toString(),
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: (16 / size.width) *
                                                  size.width,
                                            ),
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  size: 16,
                                                  color: AppColors.borderColor,
                                                ),
                                                Text(
                                                  context
                                                          .read<UserRepoCubit>()
                                                          .calculateRepoTime(
                                                            state
                                                                .userRepoModel[
                                                                    index]
                                                                .createdAt,
                                                          )
                                                          .toString() +
                                                      " dias atrás",
                                                  style: GoogleFonts.mulish(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 12,
                                                    color: AppColors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
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
