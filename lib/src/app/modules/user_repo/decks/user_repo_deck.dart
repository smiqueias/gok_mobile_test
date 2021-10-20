import 'package:flutter/material.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/description_label_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/repo_info_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/star_icon_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/component/tag_list_component.dart';
import 'package:gok_mobile_test/src/app/modules/user_repo/data/cubit/user_repo_cubit.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/extensions/string_extension.dart';
import '../../../app_colors.dart';

class UserRepoDeck extends StatelessWidget {
  final Size size;
  final int index;
  final dynamic state;
  final List<String> tags;
  final VoidCallback launchLink;
  final UserRepoCubit userRepoCubit;

  const UserRepoDeck({
    Key? key,
    required this.size,
    required this.index,
    required this.state,
    required this.tags,
    required this.launchLink,
    required this.userRepoCubit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16,
                      top: 26,
                    ),
                    child: Text(
                      state.userRepoModel[index].name!
                          .toString()
                          .intelliTrim(23),
                      style: GoogleFonts.mulish(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: (8 / size.width) * size.width,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                    ),
                    child: IconButton(
                      onPressed: () => launchLink,
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
            description: state.userRepoModel[index].description!
                .toString()
                .intelliTrim(40),
          ),
          TagListComponent(
            tags: tags,
          ),
          RepoInfoComponent(
            index: index,
            size: size,
            state: state,
            userRepoCubit: userRepoCubit,
          ),
        ],
      ),
    );
  }
}
